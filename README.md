# ChemometricsData.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://caseykneale.github.io/ChemometricsData.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://caseykneale.github.io/ChemometricsData.jl/dev)
[![Build Status](https://github.com/caseykneale/ChemometricsData.jl/workflows/CI/badge.svg)](https://github.com/caseykneale/ChemometricsData.jl/actions)
[![Coverage](https://codecov.io/gh/caseykneale/ChemometricsData.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/caseykneale/ChemometricsData.jl)

# Overview
The purpose of this package is to allow a user to have easy access to a consortium of publicly available chemometrics datasets.

Chemometrics data is widely dispersed, in a variety of file formats, and arbitrary conventions. This complicates matters for people wishing simply to load in some data and try new techniques, run a study, or even do a metanalysis. To ameliorate this, the data maintained by or scraped using this package attempts to bundle everything into an intuitive and Julia ready format that is ready for investigation or personal exploration.

# Example Usage
## Inspection
The code base provides some pretty basic commands to let users kind of poke around for data. Maybe you don't know what dataset you want, but you're interested in trying your hand at some chemometrics tasks using mid-infrared spectroscopy. You could do the following:
![terminal](https://github.com/caseykneale/ChemometricsData.jl/blob/master/images/terminal.png)

## Loading
Of course you can easily crack open the datasets and have them ready to use in a few short lines of code. Below is an example workflow of loading in some data, using some metadata, and generating a plot:
`julia
quadrum_data = load("Fresh_Meats")
meta_data = meta("Fresh_Meats")

spectra = numeric_columns( gimme_the_data )
bins = parse.( Float64, names(spectra) )
bin_display_range = 1:100:length(bins)
using Plots
plot(   spectra |> Matrix |> transpose,
        legend = false,
        title = "Fresh Meats \n (" * meta_data["URL"] * ")",
        xlabel = "Wavenumber", ylabel = "Absorbance",
        xticks = ( bin_display_range, bins[bin_display_range] )
)
`
![meat data](https://raw.githubusercontent.com/caseykneale/ChemometricsData.jl/master/images/example_plot.png)

# Liability
The creators and contributors to this package are not responsible for the outcomes of the use of any data, or code in this repository. This is to be used at ones own risk.

Before redistributing any data accessed via this package (either stored in the git repository or via the packages use) ensure that the permissions for the data allow for this. Just because something is "public domain" does not imply it may be used commercially, or redistributed without author's approval.

Should also be noted that it is possible errors exist in these datasets due to them being manipulated(transposed, file formats changed, etc) to get them into a common form. Please report any and all issues - it's greatly appreciated.

# Submissions
## How to Submit
There are several ways to contribute to this effort:
 - Make a Pull Request and submit a dataset! This should update the manifest.jl file and provide the data in a plaintext manner in a separate folder.
 - File an issue on the repository and point to where your data is. Give written permission for it's redistribution and some form of proof that you are the legal copyright owner of the data!

## Restrictions
 - Single datasets should not exceed 10mb. If it does contact us and we will navigate an alternative means of hosting(IE: not github).
 - It is highly preferable that the data is in a tabular file format, such as CSV. Proprietary file formats regularly change: companies go out of business, software gets deprecated, etc.
 - if the content or the origin of the data is suspect, it will either be not accepted, or removed.
