"""
    flatten_dir(path::String)

Takes all files nested in a directory structure and takes them to the root path.
Warning: this effects your file system. Be careful.
"""
function flatten_dir(path::String)
    allfiles = [ joinpath.(root, files) for (root, _, files) in walkdir(path) ]
    file_count = 0
    for src in Iterators.flatten( allfiles )
        if dirname(src) != path
            Base.Filesystem.mv(src, Base.Filesystem.joinpath(path, basename(src) ))
            file_count += 1
        end
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


"""
    numeric_column_names( df::DataFrame )

Returns a subset of a dataframe whose column names can be interpretted as numeric values.
"""
function numeric_column_names( df::DataFrame )
    cols = String.( names( df ) )
    numer_cols = Symbol.( cols[ isnumeric.( cols ) ] )
    return df[!, numer_cols]
end

"""
    nonnumeric_column_names( df::DataFrame )

Returns a subset of a dataframe whose column names can not be interpretted as numeric values.
"""
function nonnumeric_column_names( df::DataFrame )
    cols = String.( names( df ) )
    numer_cols = Symbol.( cols[ .!isnumeric.( cols ) ] )
    return df[!, numer_cols]
end
