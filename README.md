# spmodel.manuscript

### A Supplementary R Package to to "spmodel: Spatial Statistical Modeling and Prediction in R"

##### Michael Dumelle<sup>1</sup>, Matt Higham<sup>2</sup>, Jay M. Ver Hoef<sup>3</sup>

##### <sup>1</sup>United States Environmental Protection Agency, Corvallis, OR, USA
##### <sup>2</sup>St. Lawrence University Department of Math, Computer Science, and Statistics, Canton, NY, USA
##### <sup>3</sup>NOAA Fisheries (NMFS) Alaska Fisheries Science Center, Marine Mammal Laboratory, Seattle, WA, USA

##### For correspondence, please email Michael Dumelle at Dumelle.Michael@epa.gov

### Abstract

`spmodel` is an **R** package used to fit, summarize, and predict
  for a variety spatial statistical models applied to point-referenced or areal (lattice) data. Parameters are estimated using various methods. Additional modeling features include anisotropy, random effects, partition factors, big data approaches, and more.   Model-fit statistics are used to summarize, visualize, and compare models. Predictions at unobserved locations are readily obtainable. 

### Package Overview

This supplementary R package contains all files used in the creation of this document. Next we discuss how to use the package to access these files.

### Installation

To install the supplementary R package, either install the tarball provided alongside the submission or run
```r
install.packages("remotes") # if you don't already have remotes installed
remotes::install_github("michaeldumelle/spmodel.manuscript", ref = "main", dependencies = TRUE)
```

The package must be installed to view any of the files we discuss throughout this `README` on your machine. This package does not have to be installed to view any of these files if you want to look at them interactively using this GitHub repository.

### Data Availability

All data are available in the `spmodel` **R** package or created within the manuscript.

### Manuscript

The files required to reproduce the manuscript are available at the file path found by running
```r
system.file("preprint", package = "spmodel.manuscript")
```
To reproduce the manuscript, run `preprint.Rmd`. This manuscript was created using the rticles R package.

### Figures

The files required to reproduce figures are available at the file path found by running
```r
system.file("scripts/figures", package = "spmodel.manuscript")
```

The raw figures are available at the file path found by running
```r
system.file("preprint/figures", package = "spmodel.manuscript")
```

### Disclaimer

The views expressed in this manuscript are those of the authors and do not necessarily represent the views or policies of the U.S. Environmental Protection Agency. Any mention of trade names, products, or services does not imply an endorsement by the U.S. government or the U.S. Environmental Protection Agency. The U.S. Environmental Protection Agency does not endorse any commercial products, services, or enterprises.
