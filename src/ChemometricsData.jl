module ChemometricsData
    using MD5, JSON3, MAT, CSV, DataFrames, Crayons,
            StringDistances, DataStructures, HTTP,
            ProgressBars, DataDeps

    global DATA_PATH = Base.joinpath( @__DIR__ , "..", "data" )

    include("manifest.jl")
    include("online_manifest.jl")

    include("Validation.jl")
    export flatten_dir
    include("PostTreatment.jl")
    export isnumeric, numeric_columns, nonnumeric_columns

    """
        suggest_a_dataset(dataset_name_lc)

    if a dataset isn't found try to guess what the user tried to type.
    Note: this is an internal function.
    """
    function suggest_a_dataset( dataset_name )
        dataset_name_lc = lowercase( dataset_name )
        println(Crayon(foreground = :red), "Sorry no such dataset found.")
        db_keys = collect(keys(data_manifest))
        if length( dataset_name ) > 1
            scores = [ Levenshtein()(dataset_name_lc, lowercase(k)) for k in db_keys ]
            println(Crayon(foreground = :yellow), "By any chance did you mean to type?")
            best_guess = first( sortperm(scores) )
            println(Crayon(foreground = :yellow, italics = true), "\t " * db_keys[best_guess])
        end
    end

    """
        search(keyword::String)::Vector{String}

    Enter a keyword, such as "Food", "Forensics", measurement technique, etc, and see what datasets which are available are related too it.
    """
    function search(keyword::String)::Vector{String}
        result::Vector{String} = []
        keyword_lc = lowercase(keyword)
        for ( dataset_name, meta_data ) in data_manifest
            search_regions = vcat(  get( meta_data, "usage", ""),
                                    get( meta_data, "keywords", ""),
                                    get( meta_data, "property values", ""),
                                    get( meta_data, "measurements", "")
                                    )
            if keyword_lc in lowercase.( search_regions )
                push!( result, dataset_name )
            end
        end
        return result
    end
    export search

    """
        describe( dataset_name::String )

    Prints a high level overview of the requested dataset if it exists to the console. If it does not exist it looks for a typo via the Levenshtein distance and informs the user.
    """
    function describe( dataset_name::String )
        dataset_name_lc = lowercase( dataset_name )
        if haskey( data_manifest, dataset_name )
            println(Crayon(foreground = :blue), "Dataset found.")
            sug_path = Base.joinpath( DATA_PATH , dataset_name )
            avail = isdir( sug_path ) ? "Offline" : "Online Only"
            println(Crayon(foreground = :green), "> Available $avail " )
            if avail == "Offline"
                println(Crayon(foreground = :green), "> Contains " * string(length(readdir(sug_path))) * " files." )
            else
                if isdir(sug_path)
                    println(Crayon(foreground = :green), "> Contains " * string(length(readdir(sug_path))) * " files." )
                else
                    println(Crayon(foreground = :green), "> Dataset must be downloaded with \'fetchdata()\' to use." )
                end
            end
            for (k,v) in data_manifest[dataset_name]
                if (v != "") && (v != [""])
                    println(Crayon(foreground = :green), "> $k : $v")
                end
            end
        else
            suggest_a_dataset(dataset_name)
        end
    end
    export describe

    """
        load( dataset_name::String )

    Loads the requested dataset as a dataframe into memory, or downloads it from the internet if it exists.
    """
    function load( dataset_name::String )
        dataset_name_lc = lowercase( dataset_name )
        if haskey( data_manifest, dataset_name )
            println(Crayon(foreground = :blue), "Dataset found.")
            sug_path = Base.joinpath( DATA_PATH , dataset_name )
            avail = isdir( sug_path ) ? "Offline" : "Online Only"
            if avail == "Offline"
                assets = readdir( sug_path )
                if length( readdir( sug_path ) ) > 1
                    data = Dict([ f => DataFrame!(CSV.File(Base.joinpath(sug_path, f) )) for f in assets  ])
                else
                    data = DataFrame!(CSV.File(Base.joinpath(sug_path, first(assets) ) ))
                end
                println(Crayon(foreground = :blue), "Dataset loaded.")
                if haskey( data_manifest[dataset_name], "Usage Statement" )
                    #did the author specify a special statement for its usage?
                    println(Crayon(foreground = :red), data_manifest[dataset_name]["Usage Statement"])
                else
                    tmp = "Please honor the dataset author's contribution to our field by acknowledging their work: "
                    tmp = tmp .* ("\n" .* data_manifest[dataset_name]["references"])
                    println(Crayon(foreground = :green), first( tmp ) )
                end
                return data
            elseif haskey( online_manifest, dataset_name )
                println(Crayon(foreground = :red), "Dataset must be downloaded with the \"fetchdata()\" function.")
            else
                suggest_a_dataset(dataset_name)
            end
        end
        return nothing
    end
    export load

    """
        fetchdata( dataset_name::String )

    Will download a given dataset using information from `online_manifest.jl`.
    """
    function fetchdata( dataset_name::String )
        dataset_name_lc = lowercase( dataset_name )
        if haskey( data_manifest, dataset_name )
            println(Crayon(foreground = :blue), "Dataset found.")
            sug_path = Base.joinpath( DATA_PATH , dataset_name )
            avail = isdir( sug_path ) ? "Offline" : "Online Only"
            avail = "Online Only"
            if avail == "Offline"
                println(Crayon(foreground = :green), "Directory already exists, please delete it to redownload the dataset or use the \"load()\" function to bring it into memory.")
                println(Crayon(foreground = :green, italics = true), sug_path)
            elseif haskey( online_manifest, dataset_name )
                println(Crayon(foreground = :red), "> Creating Directory...")
                mkdir(sug_path) #works
                println(Crayon(foreground = :red), "> Downloading...\n" *
                        "from: ", online_manifest[dataset_name]["URL"], "\n" *
                        "to: ", sug_path)
                HTTP.download( online_manifest[dataset_name]["URL"], sug_path )
                compr_ext = [".zip", ".tar"]
                files = [ f for f in readdir(sug_path) if f[(end-3):end] in compr_ext ]
                (length(files) == 0) && @warn "Although a file was downloaded the file does not match the stored MD5 checksum. \n Please notify ChemometricsData.jl!"
                md5chk = [ f for f in files if check_MD5( Base.joinpath(sug_path, f), online_manifest[dataset_name]["MD5"] ) ]
                while length(files) > 0
                    file_of_interest = first( ( length( md5chk ) > 0 ) ? md5chk : files )#first( files )#
                    cd(sug_path) do #thanks Lyndon!
                        DataDeps.unpack( Base.joinpath( sug_path, file_of_interest ) )
                    end
                    flatten_dir(sug_path) #eeek this changes the filesystem don't screw up!
                    md5chk = []
                    files = [ f for f in readdir(sug_path) if f[(end-3):end] in compr_ext ]
                end
            else
                suggest_a_dataset(dataset_name)
            end
        end
        return nothing
    end
    export fetchdata

    """
        meta( dataset_name::String )

    prints the metadata associated with a dataset to the console. If the dataset does not exist it will print suggestions for similarly named datasets or keywords.
    """
    function meta( dataset_name::String )
        if haskey( data_manifest, dataset_name )
            return data_manifest[ dataset_name ]
        else
            suggest_a_dataset(dataset_name)
        end
        return nothing
    end
    export meta


end
