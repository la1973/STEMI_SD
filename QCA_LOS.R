library(QCA)
library(VennDiagram)

data <- read.csv("/Users/lucianodeandrade/Desktop/Repositorio/STEMI/QCA_LOS.csv")
View(data)
data
data<-na.omit(data)
head(data)

dataNR <- superSubset(data, outcome = "LOS", incl.cut = 0.9, cov.cut = 0.52)
dataNR
COms <- dataNR$coms[ ,1:5]

vennKrookNec <- venn.diagram(
  x=list(
    "LOS" = which(data$LOS == 1),
    "TWT" = which(COms[, 1] == 1),
    "FMC+TXF" = which(COms[, 6] == 1),
    "ecg+TXF" = which(COms[, 3] == 1)),
  filename = NULL,
  cex= 2.5, cat.cex=2, cat.pos= c(340,185,-10,10),
  cat.dist= c(0.22, 0.40, 0.12, 0.12), 
  fill = c("#BC8F8F", "#D2B48C", "#8B4513", "#D2691E"))                       
#fill = gray (c(0.3, 0.5, 0.7, 0.9)))
grid.draw(vennKrookNec)
grid.newpage()

# trthTable
TT<-truthTable(data, outcome = "LOS", show.cases = TRUE, sort.by = c("incl", "n"))
TT

TT <- truthTable(data, outcome = c("LOS"), neg.out = FALSE, conditions = c("FMC", "ECG","TXF", "TWT"),
                 n.cut = 1, incl.cut1 = 1, incl.cut0 = 1, complete = FALSE,
                 show.cases = FALSE, sort.by = c(""), decreasing = TRUE,
                 use.letters = FALSE)

TT

# solution complex
dataSC <- eqmcc(TT, details = TRUE, show.cases = TRUE)
dataSC

# parcimonious solution
dataSP <- eqmcc(TT, include = "?", rowdom = FALSE, details = TRUE)
dataSP
#dataSP$PIchart$p.sol

# solution intermediate
dataSI <- eqmcc(TT, incl.cut1 = 0.9,  include = "?", direxp = rep(1,4), details = TRUE)
dataSI


