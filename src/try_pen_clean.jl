using Pkg
Pkg.activate(".")
using ChemometricsData

using CSV, DataFrames

p = "/home/caseykneale/.julia/dev/ChemometricsData/data/Penicillin_Monitoring/100_Batches_IndPenSim_V3.csv"

z = CSV.read(p)

ChemometricsData.describe("Penicillin_Monitoring")


ChemometricsData.fetchdata("Penicillin_Monitoring")


z = ChemometricsData.load("Penicillin_Monitoring")


#using DataFrames
