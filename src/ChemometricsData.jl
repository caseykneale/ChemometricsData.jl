module ChemometricsData
    using MD5, JSON3, MAT, CSV, DataFrames, Crayons

    global DATA_PATH = Base.joinpath( @__DIR__ , "..", data)

    #package currently does nothing...

end
