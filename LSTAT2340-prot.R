## ----setup1, eval = FALSE----------------------------------------------------------------------------
## install.packages("BiocManager")


## ----setup2, eval = FALSE----------------------------------------------------------------------------
## BiocManager::install("MSnbase")














## ----loadmsnbase, message = FALSE--------------------------------------------------------------------
library("MSnbase")


## ----rawf, message = FALSE---------------------------------------------------------------------------
rawf <- dir(system.file(package = "MSnbase", dir = "extdata"),
            full.name = TRUE,
            pattern = "mzXML$")
basename(rawf)


## ----readms------------------------------------------------------------------------------------------
x <- readMSData(rawf)
x


## ----------------------------------------------------------------------------------------------------
class(x)


## ----------------------------------------------------------------------------------------------------
length(x)


## ----------------------------------------------------------------------------------------------------
msLevel(x)
rtime(x)
precursorMz(x)
precursorIntensity(x)


## ----------------------------------------------------------------------------------------------------
x[[3]]


## ----fig.cap = "Visualisation of the 3rd MS spectrum in our small test data set."--------------------
plot(x[[3]])


## ----------------------------------------------------------------------------------------------------
data(itraqdata)


## ----------------------------------------------------------------------------------------------------
length(itraqdata)
unique(msLevel(itraqdata))
formatRt(range(rtime(itraqdata)))




## ----calcfrag----------------------------------------------------------------------------------------
calculateFragments("SIGFEGDSIGR")


## ----echo=TRUE, fig.cap = "Matching observed and expected peaks."------------------------------------
itraqdata2 <- pickPeaks(itraqdata, verbose = FALSE)
s <- "SIGFEGDSIGR"
plot(itraqdata2[[14]], s, main = s)


## ----fig.cap = "Direct comparison of 2 MS2 spectra."-------------------------------------------------
plot(itraqdata2[[25]], itraqdata2[[28]],
     sequences = rep("IMIDLDGTENK", 2))






## ----------------------------------------------------------------------------------------------------
fData(itraqdata2)$PeptideSequence[[44]]


## ----------------------------------------------------------------------------------------------------
plot(itraqdata2[[44]], s,
     main = fData(itraqdata2)$PeptideSequence[[44]])












## ----fig.cap = "Visualisation of the iTRAQ reporter peaks.", echo=TRUE-------------------------------
plot(itraqdata[[14]], reporters = iTRAQ4, full = TRUE)


## ----------------------------------------------------------------------------------------------------
msnset <- quantify(itraqdata, method = "trap",
                   reporters = iTRAQ4)
msnset
head(exprs(msnset))
head(fData(msnset))




## ----------------------------------------------------------------------------------------------------
table(is.na(exprs(msnset)))
msnset <- filterNA(msnset)


## ----------------------------------------------------------------------------------------------------
prots <- combineFeatures(msnset, fcol = "ProteinAccession",
                         method = "median")
head(exprs(prots))




## ----message=FALSE-----------------------------------------------------------------------------------
library("pRoloc")
library("pRolocdata")


## ----fig.cap = "Mouse stem cell spatial proteomics data from Christoforou et al.", fig.asp = 1-------
data(hyperLOPIT2015)
## set colours
setStockcol(paste0(getStockcol(), 80))
## produce PCA plot
plot2D(hyperLOPIT2015)


## ----fig.cap = "New sub-cellular assignment after using support vector machine classifier.", fig.asp = 1----
sz <- exp(fData(hyperLOPIT2015)$svm.score) - 1
plot2D(hyperLOPIT2015, fcol = "final.assignment", cex = sz)


## ----si, echo=FALSE----------------------------------------------------------------------------------
sessionInfo()

