# simpleSampleSearch
The stupid man's GEOmetadb!

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
```

Look for new Illumina HumanMethylation450 datasets:
```r
getRecent(simpleSampleSearch:::HM450)
```
```
data frame with 10 rows and 2 columns
                                                          descr         gse
                                                    <character> <character>
1  DNA methylation signatures triggered by prenatal maternal st    GSE72354
2  Low dose of DNA-demethylating agents target colorectal cance    GSE62086
3  Epigenetics and Proteomics Join Transcriptomics in the Quest    GSE70478
4  Cell-specific methylation patterns in TB patients and househ    GSE72338
5                Epigenome analysis of ischemic stroke patients    GSE69138
6  The idiopathic preterm delivery methylation profile in umbil    GSE66459
7  Intra-gene DNA methylation variability is a technically and     GSE72021
8  Epigenetic landscape correlates with genetic subtype but doe    GSE69229
9  Age-associated genomic methylation in the TOPS Family Study     GSE60132
10 Epigenome-wide and Transcriptome-wide Analyses Reveal Gestat    GSE70494
```

Get series with the word "glio" in their name, on Affy hgu133plus2, by most recent update:
```
getExperiments("glio", gpl="GPL570")
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

Look at a particular series' details:
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

Coming soon(ish): SRA search that is less excruciating than NCBI's interface.
