library(tesseract)
library(tidyverse)
library(pdftools)

setwd("/Users/thomastallaksen/Documents/R/Prosjekter/Poli Sci 452 - Text as Data/Ingvild/Test")

#file_list <- dir(path = ".", pattern = "\\.pdf$", full.names = TRUE, recursive = TRUE)

pdf_convert("/Users/thomastallaksen/Documents/R/Prosjekter/Poli Sci 452 - Text as Data/Lectures/Lecture 3/Ban_et_al_Newspapers.pdf")

filelist <- list.files(pattern = ".*.png")

datalist <- lapply(filelist, function(x)ocr(x))

datafr = do.call("rbind", datalist) 

