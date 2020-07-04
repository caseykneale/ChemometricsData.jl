# ChemometricsData.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://caseykneale.github.io/ChemometricsData.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://caseykneale.github.io/ChemometricsData.jl/dev)
[![Build Status](https://github.com/caseykneale/ChemometricsData.jl/workflows/CI/badge.svg)](https://github.com/caseykneale/ChemometricsData.jl/actions)
[![Coverage](https://codecov.io/gh/caseykneale/ChemometricsData.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/caseykneale/ChemometricsData.jl)

# Overview
The purpose of this package is to allow a user to have easy access to a consortium of publicly available chemometrics datasets.

Chemometrics data is widely dispersed, in a variety of file formats, and arbitrary conventions. This complicates matters for people wishing simply to load in some data and try new techniques, run a study, or even do a metanalysis (IE: train an autoencoder on data from say all NIR instruments). To amelerioate this, the data maintained or scraped using this package attempts to bundle everything into an intuitive and Julia ready format ready for investigation or personal exploration.

# Liability
The creators and contributors to this package are not responsible for the outcomes of the use of any data, or code in this repository. This is to be used at ones own risk.

Before redistributing any data accessed via this package (either stored in the git repository or via the packages use) ensure that the permissions for the data allow for this. Just because something is "public domain" does not imply it may be used commercially, or redistributed without author's approval.

# Submissions
## How to Submit
There are several ways to contribute to this effort:
 - Make a Pull Request and submit a dataset! This should update the manifest.jl file and provide the data in a plaintext manner in a seperate folder.
 - File an issue on the repository and point to where your data is. Give written permission for it's redistribution and some form of proof that you are the legal copyright owner of the data!

## Restrictions
 - Data should not exceed 10mb. If it does contact us and we will navigate an alternative means of hosting
 - It is highly preferable that the data is in a tabular file format, such as CSV. Proprietary file formats regularly change (companies go out of business, software gets deprecated, etc).
 - if the content or the origin of the data is suspect, it will be either not accepted, or removed.
