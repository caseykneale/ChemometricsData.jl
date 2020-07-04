
manifest = Dict(
"IDRC_2002_Pharma_Shootout" =>
    Dict(
        "usage" => ["Calibration transfer", "regression"],
        "keywords" => [ "API", "Pharmaceuticals", "IDRC", "shootout"],
        "property values" => ["weight","hardness","assay"],
        "measurements" => ["NIR"],
        "spectral range" => "600-1398nm",
        "spectral resolution" => "2nm",
        "observations" => "654",
        "format" => "csv",
        "description" => "\"Spectra of 654 pharmaceutical tablets from two Multitab spectrometers (FossNIRsystems, Silverspring, MD) will be the basis of the ShootOut at the next Chambersburg meeting (August 10-16, 2002). All tablets were measured in the transmittance mode.  Each individual tablet was subsequently analyzed for ASSAY value, tablet weight, and tablet hardness. All log (1/T) spectra cover the region from 600 to 1898 nm in 2 nm increments.\"... \"Data from each instrument has been split into a calibration file (155 spectra), and a validation file (459 spectra). In addition, a small test file (40 spectra) from each instrument is avaliable for testing calibrations. The challenge is to develop the best possible calibration for the ASSAY value on one instrument, and to provide the best means of transferring the calibration to the other instrument. The reference method has an error of +/- 1.3 mg on these tablets with a nominal value of 200 mg per tablet. The data set includes tablets with a wide ASSAY range, 152 to 239 mg, for developing calibration(s). No deliberate outliers are included in the data set, but there may be outliers due to experimental errors. The name of the active ingredient in these tablets can not be disclosed for proprietary reasons.\"",
        "URL" => "https://web.archive.org/web/20031204005143/http://www.idrc-chambersburg.org/shootout_2002.htm",
        "Date Accessed" => "7/3/2020",
        "references" => ["Gary E. Ritchie, Chairman NIRVWoG and Sr. Scientist, Pharmaceutical Analysis/New Technology, Purdue Pharma L.P., 444 Saw Mill River Road, Ardsley, NY 10502",
                        "http://www.foss.dk/c/p/solutions/products/showprodfamily.asp?prodfamilypkid=98"],
        "permission" => "Public domain. Given to Dr. Casey Kneale via e-mail in 2018."
    ),

"Tecator_Meat_Data" =>
    Dict(
        "usage" => ["regression"],
        "keywords" => ["food", "meat"],
        "property values" => ["fat","water","protein"],
        "format" => "csv",
        "measurements" => ["NIR"],
        "spectral range" => "850-1050nm",
        "spectral resolution" => "",
        "observations" => "240",
        "description" => "Statement of permission from Tecator (the original data source).These data are recorded on a Tecator Infratec Food and Feed Analyzer working in the wavelength range 850 - 1050 nm by the Near Infrared Transmission (NIT) principle. Each sample contains finely chopped pure meat with different moisture, fat and protein contents.If results from these data are used in a publication we want you to mention the instrument and company name (Tecator) in the publication. In addition, please send a preprint of your article to Karin Thente, Tecator AB, Box 70, S-263 21 Hoganas, Sweden. The data are available in the public domain with no responsability from the original data source. The data can be redistributed as long as this permission note is attached. For more information about the instrument - call Perstorp Analytical's representative in your area.",
        "URL" => "https://www.openml.org/d/505",
        "Date Accessed" => "7/3/2020",
        "references" => [""],
        "permission" => "Public domain with statement of permission."
    ),

"Cargill_Corn_Data" =>
    Dict(
        "usage" => ["calibration transfer", "regression"],
        "keywords" => ["food", "corn"],
        "property values" => ["moisture", "oil", "protein", "starch"],
        "format" => "csv",
        "measurements" => ["NIR"],
        "spectral range" => "1100-2498nm",
        "spectral resolution" => "2nm",
        "observations" => "80",
        "description" => "This dataset contains 80 NIR measures of corn taken from 3 different instruments( M5, MP5,and MP6 ).
        Measures of NBS glass standards (with replicates) on each instrument are also contained in seperate files.",
        "URL" => "",
        "Date Accessed" => "7/3/2020",
        "references" => [""],
        "permission" => "Public domain. Permission to redistribute given to Dr. Casey Kneale granted by Mike Blackburn 6/3/2020"
    ),

"Southwest_Research_Institute_Diesel_Fuels" =>
    Dict(
        "usage" => ["regression", "impution", "semisupervised learning"],
        "keywords" => ["diesel", "fuel", "oil", "gas", "SWRI"],
        "property values" => ["bp50", "CN", "d4052", "freeze", "total"],
        "format" => "csv",
        "measurements" => ["NIR"],
        "spectral range" => "750-1550nm",
        "spectral resolution" => "2nm",
        "observations" => "785",
        "description" => "Various diesel fuels were measured with a single NIR instrument
        bp50 - boilingpoint (*C) at 50% recovery(ASTM D 86)
        CN - Cetane Number (ASTM D 613)
        d4052 - density, g/mL (15*C ASTM D 4052)
        freeze - freezing temperature of the fuel, deg C
        total - total aromatics (mass% ASTM D 5186)
        visc - viscosity, cSt(40*C)",
        "URL" => "https://eigenvector.com/wp-content/uploads/2019/06/SWRI_Diesel_NIR_CSV.zip",
        "Date Accessed" => "7/3/2020",
        "references" => [""],
        "permission" => "Public Domain. Collection funded by the US Army."
    ),

"Fruit_Puree_Adulteration" =>
    Dict(
        "usage" => ["Classification", "One class classification"],
        "keywords" => ["food", "fruit", "adulteration", "interferent"],
        "format" => "csv",
        "measurements" => ["MIR"],
        "spectral range" => "899.327-1802.564 cm-1",
        "spectral resolution" => "3.86cm-1",
        "observations" => "983",
        "description" => "...\"a collection of 983 Mid-infrared spectra collected from
        different authenticated fruit purees in one of two classes:
        \"Strawberry\" (purees prepared from fresh whole fruits by the researchers)
        \"NON-Strawberry\" (diverse collection of other purees, including: strawberry adulterated with other fruits and sugar solutions; raspberry; apple; blackcurrant; blackberry; plum; cherry; apricot; grape juice and mixtures of these.\"
         ",
        "URL" => "https://csr.quadram.ac.uk/example-datasets-for-download/",
        "Date Accessed" => "7/3/2020",
        "references" => ["\"Use of Fourier transform infrared spectroscopy and partial least squares regression for the detection of adulteration of strawberry purees\" Holland JK, Kemsley EK, Wilson RH. (1998). Journal of the Science of Food and Agriculture, 76, 263-269"],
        "permission" => "BBSRC policy on data sharing. Free to analyse and redistribute the data; if the original source is cited."
    ),

"Fresh_Meats" =>
    Dict(
        "usage" => ["Classification", "Authentication"],
        "keywords" => ["food", "chicken", "pork", "turkey"],
        "format" => "csv",
        "measurements" => ["MIR"],
        "spectral range" => "1005.3495-1867.864 cm-1",
        "spectral resolution" => "1.93cm-1",
        "observations" => "120",
        "description" => "...\"120 Mid-infrared (MIR) spectra of fresh minced meats – chicken, pork and turkey. Duplicate acquisitions from 60 independent samples. Raw data matrix size [448 x 120]. Obtained using Fourier transform infrared (FTIR) spectroscopy with attenuated total reflectance (ATR) sampling\"",
        "URL" => "https://csr.quadram.ac.uk/example-datasets-for-download/",
        "Date Accessed" => "7/3/2020",
        "references" => ["\"Mid-infrared spectroscopy and authenticity problems in selected meats: a feasibility study\" Al-Jowder O, Kemsley E K, Wilson R. H.(1997) Food Chemistry 59 195-20."],
        "permission" => "BBSRC policy on data sharing. Free to analyse and redistribute the data; if the original source is cited."
    ),
"Olive_Oils_Quadrum" =>
    Dict(
        "usage" => ["Classification", "Provenance"],
        "keywords" => ["food", "olive", "oil"],
        "format" => "csv",
        "measurements" => ["FTIR"],
        "spectral range" => "798.892-1896.8085 cm-1",
        "spectral resolution" => "1.93 cm-1",
        "observations" => "120",
        "description" => "...\" contains a collection of 120 Mid-infrared spectra collected from 60 different authenticated extra virgin olive oils, supplied to the Institute of Food Research, UK, by the International Olive Oil Council.
        Spectra were acquired from each oil using attenuated total reflectance (ATR) sampling.  The acquisition order was randomized with respect to the country of origin code.
        Once all the samples had been examined once, a second acquisition session commenced, to produce a second spectrum from each sample.  Again the acquisition order was randomized with respect to country of origin.  thus, duplicate spectra were collected from all samples.
        \"",
        "URL" => "https://csr.quadram.ac.uk/example-datasets-for-download/",
        "Date Accessed" => "7/3/2020",
        "references" => ["\"FTIR spectroscopy and multivariate analysis can distinguish the geographic origin of extra virgin olive oils\" Tapp H.S. et al, J. Agric. Food Chem. 51 (21) 6110-5 (2003) "],
        "permission" => "BBSRC policy on data sharing. Free to analyse and redistribute the data; if the original source is cited."
    ),

"Instant_Coffee_Quadrum" =>
    Dict(
        "usage" => ["Classification", "Provenance", "Fraud"],
        "keywords" => ["food", "instant", "coffee", "arabica", "robusta"],
        "format" => "csv",
        "measurements" => ["MIR", "DRIFT", "MIR-DRIFT"],
        "spectral range" => "810.548-1910.644 cm-1",
        "spectral resolution" => "3.86 cm-1",
        "observations" => "56",
        "description" => "...\"Mid-infrared (MIR) spectra of authenticated freeze-dried coffee samples (arabica and robusta species, respectively 29 and 27 of each). Raw data matrix size is [286 x 56]. Obtained by Fourier transform infrared (FTIR) spectroscopy with diffuse reflectance (DRIFT) sampling.\"",
        "URL" => "https://csr.quadram.ac.uk/example-datasets-for-download/",
        "Date Accessed" => "7/3/2020",
        "references" => [   "\"Discrimination of Arabica and Robusta in Instant Coffee by Fourier Transform Infrared Spectroscopy and Chemometrics\" Briandet R et al, J. Agric. Food Chem., 44 (1),170–174 (1996)",
                            "\"Near- and Mid-Infrared Spectroscopies in Food Authentication: Coffee Varietal Identification\" Downey G. et al, J. Agric. Food Chem. 45 (11) 4357-4361 (1997)."],
        "permission" => "BBSRC policy on data sharing. Free to analyse and redistribute the data; if the original source is cited."
    )

"Raman_PUFA" =>
    Dict(
        "usage" => ["Regression"],
        "keywords" => ["food", "polyunsaturated", "PUFA", "fat"],
        "property values" => ["PUFA%emul", "%PUFA"],
        "format" => "csv",
        "measurements" => ["Raman"],
        "spectral range" => "675-1697 cm-1",
        "spectral resolution" => "1.0 cm-1",
        "observations" => "69",
        "description" => " see citation for more details. ",
        "URL" => "https://data.mendeley.com/datasets/3ympjxywdm/1",
        "Date Accessed" => "7/4/2020",
        "references" => [ "Rimal, Raju; Almøy, Trygve; Sæbø, Solve (2019), \"Data for: Comparison of Multi-response Prediction Methods\", Mendeley Data, v1 http://dx.doi.org/10.17632/3ympjxywdm.1 "],
        "permission" => "CC BY NC 3.0."
    )

"Dough_NIR" =>
    Dict(
        "usage" => ["Regression"],
        "keywords" => ["food", "dough"],
        "property values" => ["fat", "sucrose", "flour", "water"],
        "format" => "csv",
        "measurements" => ["Raman"],
        "spectral range" => "1000-2498 nm",
        "spectral resolution" => "2.0 nm",
        "observations" => "73",
        "description" => " see citation for more details. ",
        "URL" => "https://data.mendeley.com/datasets/3ympjxywdm/1",
        "Date Accessed" => "7/4/2020",
        "references" => [ "Rimal, Raju; Almøy, Trygve; Sæbø, Solve (2019), \"Data for: Comparison of Multi-response Prediction Methods\", Mendeley Data, v1 http://dx.doi.org/10.17632/3ympjxywdm.1 "],
        "permission" => "CC BY NC 3.0."
    )

)
