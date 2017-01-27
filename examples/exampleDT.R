# Example usage of the rkekule package with DT
# 
# Author: Daan Seynaeve <daan.seynaeve@openanalytics.eu>
###############################################################################

library(rkekule)
library(htmltools)
library(DT)

mol1 <- readMolfile(system.file("extdata", "example1.mol", package = "rkekule"))
mol2 <- readMolfile(system.file("extdata", "example2.mol", package = "rkekule"))
# cml3 <- readCML(system.file("extdata", "example3.cml", package = "rkekule"))
# cml4 <- readCML(system.file("extdata", "example4.cml", package = "rkekule"))

tbl <- data.frame(
    structure = c(mol1, mol2),
    trivial_name = c("sucrose", "caffeine"),
    value = c(42, 1302))

widget <- datatable(
    data = tbl,
    escape = FALSE,
    options = list(
        columnDefs = list(rkekuleColumnDefs(1, useTooltip = FALSE)),
        fnDrawCallback = rkekuleFnDrawCallback(
            settings = "type: 'mol', width: 100, height: 100")))

widget <- browsable(attachRkekuleDependencies(div(widget)))

print(widget)