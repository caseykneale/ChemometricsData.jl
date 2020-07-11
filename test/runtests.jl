using ChemometricsData
using Test

@testset "ChemometricsData.jl" begin
    @test isnumeric("123") == true
    @test isnumeric("1boop23") == false
end
