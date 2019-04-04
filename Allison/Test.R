
library(tidyverse)
  

  # for (url in urls) {
  #   download.file(url, destfile = basename(url))
  # }
  
  
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
  
  
  webpage <- xml2::read_html("http://mneguidelines.oecd.org/database/instances/cl0003.htm")
  
  
  # <tr><th>Summary</th><td><p>In April 2007 the Chilean NCP received a request for review from the Chilean Trade Union Confederation (CUT) alleging that ISS Facitliy Services, a Danish multinational Enterprise, had breached employment and industrial relations provisions of the Guidelines by its treatment of staff. It was alleged that ISS did not recognise the collective bargaining agreement of staff which had been outsourced to the company and had insisted that workers accept working conditions below the legal norm and to quit the trade union.<br /><br />The specific instance has been concluded due to lack of action from the trade union parties.</p></td></tr>
  #   </tbody>
  