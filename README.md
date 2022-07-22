# spmodel.manuscript

### A Supplementary R Package to to "spmodel: Spatial Statistical Modeling and Prediction in R"

##### Michael Dumelle<sup>1</sup>, Matt Higham<sup>2</sup>, Jay M. Ver Hoef<sup>3</sup>

##### <sup>1</sup>United States Environmental Protection Agency, Corvallis, OR, USA
##### <sup>2</sup>St. Lawrence University Department of Math, Computer Science, and Statistics, Canton, NY, USA
##### <sup>3</sup>NOAA Fisheries (NMFS) Alaska Fisheries Science Center, Marine Mammal Laboratory, Seattle, WA, USA

##### For correspondence, please email Michael Dumelle at Dumelle.Michael@epa.gov

### Abstract

Fit, summarize, and predict for a variety spatial statistical models. Parameters are estimated using various methods. Additional modeling features include anisotropy, random effects, partition factors, big data approaches, and more.   Model-fit statistics are used to summarize, visualize, and compare models. Predictions at unobserved locations are readily obtainable.

### Package Overview

This supplementary R package contains all files used in the creation of this document. Next we discuss how to use the package to access these files.

### Installation

To install the supplementary R package, either install the tarball provided alongside the submission or run
```r
install.packages("remotes") # if you don't already have remotes installed
remotes::install_github("michaeldumelle/spmodel.manuscript", ref = "main", dependencies = TRUE)
```

The package must be installed to view any of the files we discuss throughout this `README` on your machine. This package does not have to be installed to view any of these files if you want to look at them interactively using this GitHub repository.

To install the development vesion of spmodel that corresponds to this submission, either install the tarball provided alongside the submission or run
```r
remotes::install_github("USEPA/spmodel", ref = "develop")
```

### Replication Scripts

After installing the package, the replication scripts (will be) available in the "replication" folder located on your machine at the file path found by running
```r
system.file("scripts/replication", package = "spmodel.manuscript")
```

There (will be) four files in this folder:

1. `code.Rmd`: An R Markdown document that contains 1) text explaining the code output and 2) the code output itself. Knitting this document yields two output files, `code.md`, and`code.html`, which we dicuss next.
2. `code.md`: A Markdown document that contains the output from `code.Rmd`. Rather than compiling `code.Rmd` itself, we recommend viewing the contents of `code.md` on this repository available here.
3. `code.html`: The HTML output viewable after knitting `code.Rmd`. However, we recommend using `code.md` to view the `code.Rmd` output.
4. `code.R`: An R script that contains comments that 1) briefly explains the code output and 2) contains the code output itself. However, we recommend using `code.Rmd` to run the code and `code.md` to view the output.

### Other Scripts

### Data Availability

### Manuscript

The files required to reproduce the manuscript are avaiable at the file path found by running
```r
system.file("preprint", package = "spmodel.manuscript")
```
or available for viewing here. To reproduce the manuscript, run `preprint.Rmd`. This manuscript was created using the preprints R package. More information about preprints is available here.

### Output 

