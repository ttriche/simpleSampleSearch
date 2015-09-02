# simpleSampleSearch
a trivial R package to search GEO and SRA without the huge hassle of the NCBI interfaces

Installation:
```r
source("http://bioconductor.org/biocLite.R")
biocLite("devtools")
biocLite("ttriche/simpleSampleSearch")
```

Usage:
```r
library(simpleSampleSearch)
checkForUpdates() ## if there is a new release of the geoMetaDb database, pull it
getExperiments("glio", gpl="GPL570") ## search phrase "glio" on Affy hgu133plus2 by update
```
```
data frame with 10 rows and 2 columns
                                                          descr         gse
                                                    <character> <character>
1  Transcriptomic profiling associated with temozolomide (TMZ)     GSE47809
2  Gene expression profiles of PTPRZ1-knocking-down human gliob    GSE69081
3  PTPRZ1 disruption-mediated gene expression changes in human     GSE68994
4  caArray_gabri-00003: TCGA Analysis of RNA Expression for Gli    GSE68850
5             Expression data from glioblastoma stem-like cells    GSE68424
6  Expression data from benign and malignant pheochromocytomas     GSE67066
7  Expression data from U-87 human glioma cells with proficient    GSE65363
8  Human ESC-based modeling of pediatric gliomas by K27M mutati    GSE55541
9       Genes regulated by miR-127-3p in glioblastoma cell line    GSE50173
10 DNA methylation alteration and gene expression sigature in b    GSE50774
```
```r
getDetails("GSE55541")
```
```
$title
[1] "Human ESC-based modeling of pediatric gliomas by K27M mutation in histone H3.3 variant"

$submission_date
[1] "2014-03-04"

$type
[1] "Expression profiling by array"
```
