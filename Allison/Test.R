
library(tidyverse)
library(rvest)
  


  
  scraplinks <- function(url){
    # Create an html document from the url
    webpage <- xml2::read_html(url)
    # Extract the URLs
    url_ <- webpage %>%
      rvest::html_nodes("a") %>%
      rvest::html_attr("href")
    # Extract the link text
    link_ <- webpage %>%
      rvest::html_nodes("a") %>%
      rvest::html_text()
    return(data_frame(link = link_, url = url_))
  }
  
  links <- scraplinks("http://mneguidelines.oecd.org/database/instances/")
  
  links_instances <- links%>%
    filter(str_detect(url, "/database/instances/"))%>%
    filter(str_detect(url, ".htm"))%>%
    mutate(full_url = paste("http://mneguidelines.oecd.org", url, sep = ""))%>%
    select(link, full_url)
    
  summary <- function(url){
    # Create an html document from the url
    webpage <- html(url)
    # Extract the summary
    summary_ <- webpage%>%
      rvest::html_nodes("p") %>%
      rvest::html_text()
    return(data_frame(summary = summary_))
  }
