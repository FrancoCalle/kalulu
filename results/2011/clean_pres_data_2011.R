## empty memory (!)
rm(list=ls())

root <- 'C:/Users/franc/OneDrive/Documents/GitHub/Chicagobooth/'

pres <- read.csv(file.path(root, 'kalulu', 'results', '2011', '2011_Pres_Pstn.csv'),colClasses = "character", sep = ";")
pres <- unique(pres)
pres <- pres[-c(26,27),]


### transform into to numeric data:
class(pres$REGISTERED.VOTERS)
cols <- 11:22
pres[,cols] <- lapply(pres[,cols],function(pres){as.numeric(gsub("([0-9]+)\\.([0-9])", "\\1\\2", pres))})

### Replace column names:
new_colname  <- c()

for (cc in colnames(pres)) {
  new_colname <- c(new_colname, gsub("\\.", "_", cc))
}

colnames(pres) <- new_colname

### save as CSV file
write.csv(pres, file.path(root, 'kalulu', 'results', '2011', '2011_Pres_Pstn_processed.csv'))

