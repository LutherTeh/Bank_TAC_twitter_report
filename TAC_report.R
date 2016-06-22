
## This is an auto collect Twitter tweet on Maybank & CIMB bank TAC complaint, create a report with complaint count and Datatable
## and send to Technology manager to monitor the progression

## consist of 3 components: TAC_report.r , TAC_report.Rmd,  task.bat 
##TAC_report.Rmd - code with call Twitter API and collect relevant tweet, compile and generate a HTML report
##task.bat - schedule task to execute the task


if (!"pacman" %in% dir(.libPaths())) devtools::install_github("trinker/pacman")
pacman::p_load(rmarkdown, knitr)
pacman::p_load_gh("trinker/gmailR")

## setup your local settings
setwd("C:/Users/km.teh/Desktop/BDA/TACreport")

unlink("reports", recursive = TRUE, force = FALSE)

rmarkdown::render("TAC_report.Rmd", "all", output_dir = "reports")

gmailR::gmail(
  to=c("##put your recipient here"), 
  subject = "Twitter daily report on BANK TAC complaint", 
  password = "##put your gmail password",
  message = "Please find the attached HTML report **this is an auto-generated daily report - Kim Ming",
  attachment = "reports/TAC_report.html",
  username = "LutherTeh0204@gmail.com"
)
