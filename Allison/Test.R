
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
    select(link, full_url)%>%
    mutate(html = map(full_url, read_html))
                    
  summary <- function(html){
    summary <- html%>%
      rvest::html_nodes("p") %>%
      rvest::html_text()
    return(summary)
  }
  
link_summary <- links_instances%>%
  mutate(text = map(html, summary))%>%
  select(link, full_url, text)%>%
  unnest()

write_csv(link_summary, "Allison/summary_texts.csv")
