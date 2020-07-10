"""
    flatten_dir(path::String)

Takes all files nested in a directory structure and takes them to the root path.
Warning: this effects your file system. Be careful.
"""
function flatten_dir(path::String)
    #println(path)#"/home/caseykneale/.julia/dev/ChemometricsData")
    allfiles = [ joinpath.(root, files) for (root, _, files) in walkdir(path) ]
    file_count = 0
    for src in Iterators.flatten( allfiles )
        println(src)
        println(path)
        Base.Filesystem.mv(src, Base.Filesystem.joinpath(path, basename(src) ))
        file_count += 1
    end
    @warn   "ChemometricsData.jl has flattened $path containing $file_count files. \n" *
            "The directory structure has been preserved."
    return nothing
end

"""
    isnumeric(s::String)::Boolean

returns true if the String `s` contains only numeric characters.
"""
isnumeric(s::String)::Boolean = tryparse(Float64, s) isa Number

function numeric_column_names( df::DataFrame )
    cols = String.( names( df ) )
    numer_cols = Symbol.( cols[ isnumeric.( cols ) ] )
    return df[!, numer_cols]
end

function nonnumeric_column_names( df::DataFrame )
    cols = String.( names( df ) )
    numer_cols = Symbol.( cols[ .!isnumeric.( cols ) ] )
    return df[!, numer_cols]
end
