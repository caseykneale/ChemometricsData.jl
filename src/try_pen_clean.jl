using Pkg
Pkg.activate(".")
using ChemometricsData

z = ChemometricsData.load("Penicillin_Monitoring")

using CSV, DataFrames
p = "/home/caseykneale/.julia/dev/ChemometricsData/data/Penicillin_Monitoring/100_Batches_IndPenSim_V3.csv"
z = CSV.read(p; threaded = false)

CSV.File(Base.joinpath(sug_path, f); threaded=false )


ChemometricsData.describe("Penicillin_Monitoring")


ChemometricsData.fetchdata("Penicillin_Monitoring")




#using DataFrames
