
setwd("/Users/thomastallaksen/Documents/R/Prosjekter/Poli Sci 452 - Text as Data/Allison")



  urls <- (c(  
  
  "http://www.kcab.or.kr/jsp/comm_jsp/BasicDownload.jsp?FilePath=ncpform/f_0.72939224258533911483793426959&orgName=161230%20KNCP_Final%20Statement_AG.pdf",
  
  "https://pcnitalia.mise.gov.it/attachments/article/2035928/Initial%20assessment%20FIOM-CGIL%20BEKAERT.pdf", 
  
  "https://economie.fgov.be/sites/default/files/Files/Entreprises/Communique-Evaluation-Initiale-Adimed-PCN-belge.pdf", 
  
  "http://www.kcab.or.kr/jsp/comm_jsp/BasicDownload.jsp?FilePath=ncpform/f_0.74228457910761461544055886093&orgName=(%BA%B8%B0%ED%BE%C8%B0%C7)%20Final%20Statement%20(Corning)_Eng4%A1%DA.docx"
  
  ))
  
  
  
  for (url in urls) {
    download.file(url, destfile = basename(url))
  }