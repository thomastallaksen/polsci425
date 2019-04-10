library(tesseract)
library(tidyverse)
library(pdftools)

setwd("~/Desktop/OCR/Test/pdf")

norwegian <- tesseract("nor")

filelist_pdf <- list.files(pattern = ".*.pdf")
datalist_pdf <- lapply(filelist_pdf, function(x)pdf_convert(x, dpi = 600))
           
filelist_png <- list.files(pattern = ".*.png")

ocr_to_txt <- function(x){
  txt <- ocr(x, engine = norwegian)
  write.table(txt, paste("~/Desktop/OCR/Test/txt/", x, ".txt", sep = ""))
}

lapply(x, function(x)ocr_to_txt(x))


