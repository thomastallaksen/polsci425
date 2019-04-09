library(tesseract)
library(tidyverse)
library(pdftools)

setwd("~/Desktop/OCR/Test/pdf")

filelist_pdf <- list.files(pattern = ".*.pdf")
datalist_pdf <- lapply(filelist_pdf, function(x)pdf_convert(x, dpi = 600))
           
filelist_png <- list.files(pattern = ".*.png")
datalist_png <- lapply(filelist_png, function(x)ocr(x))

df <- do.call("rbind", datalist_png) 

#lapply(datalist, function(x)write.table(x, paste(x, ".txt", sep = "") , sep="\t"))

