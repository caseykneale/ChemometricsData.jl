module ChemometricsData
    using MD5, JSON3, MAT, CSV, DataFrames, Crayons, StringDistances, DataStructures

    global DATA_PATH = Base.joinpath( @__DIR__ , "..", "data" )

    include("manifest.jl")

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

    function describe( dataset_name::String )
        dataset_name_lc = lowercase( dataset_name )
        if haskey( data_manifest, dataset_name )
            println(Crayon(foreground = :blue), "Dataset found.")
            sug_path = Base.joinpath( DATA_PATH , dataset_name )
            avail = isdir( sug_path ) ? "Offline" : "Online Only"
            println(Crayon(foreground = :green), "> Available $avail " )
            if avail == "Offline"
                println(Crayon(foreground = :green), "> Contains " * string(length(readdir(sug_path))) * " files." )
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
                return data
            else
                suggest_a_dataset(dataset_name)
            end
        end
        return nothing
    end
    export load

    function meta( dataset_name::String )
        if haskey( data_manifest, dataset_name )
            return data_manifest[ dataset_name ]
        else
            suggest_a_dataset(dataset_name)
        end
        return nothing
    end
    export meta

    isnumeric(s::String) = tryparse(Float64, s) isa Number

    function numeric_columns( df::DataFrame )
        cols = String.( names( df ) )
        numer_cols = Symbol.( cols[ isnumeric.( cols ) ] )
        return df[!, numer_cols]
    end
    export numeric_columns

    function nonnumeric_columns( df::DataFrame )
        cols = String.( names( df ) )
        numer_cols = Symbol.( cols[ .!isnumeric.( cols ) ] )
        return df[!, numer_cols]
    end
    export nonnumeric_columns

end
