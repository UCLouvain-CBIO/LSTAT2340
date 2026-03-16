## Get the data

library(MSnbase)
data(itraqdata)
itraqdata2 <- pickPeaks(itraqdata, verbose = FALSE)

## Build the Spectra object

spdf <- DataFrame(mz = List(mz(itraqdata2)),
                  intensity = List(intensity(itraqdata2)),
                  msLevel = msLevel(itraqdata),
                  rtime = rtime(itraqdata),
                  ProteinAccession = fData(itraqdata2)$ProteinAccession,
                  ProteinDescription = fData(itraqdata2)$ProteinDescription,
                  sequence = as.character(fData(itraqdata2)$PeptideSequence),
                  row.names = NULL)

sp <- Spectra(spdf)

saveRDS(sp, file = "itraqdata2-spectra.rds")
