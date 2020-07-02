using ChemometricsData
using Documenter

makedocs(;
    modules=[ChemometricsData],
    authors="caseykneale",
    repo="https://github.com/caseykneale/ChemometricsData.jl/blob/{commit}{path}#L{line}",
    sitename="ChemometricsData.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://caseykneale.github.io/ChemometricsData.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/caseykneale/ChemometricsData.jl",
)
