# READING IN DATA-------------------------------------------------------------------
# ---------------------------------------------------------------------------------
# Memory Requirements Calculations
# 1.5mm rows * 120 cols * 8 bytes(numeric)
x <- 1500000 * 120 * 8
x  #in MB

x <- 1304287 * 28 * 8
x <- x/(2^20)


## Reading in multiple objects in a loop
files <- list.files(pattern="*.csv", full.names=TRUE)
files <- as.data.frame(files)

for(i in 1:nrow(files)){
  
  x <- read.csv(paste0(dir,files$files[i]))
  assign(paste0("x",i),x)
  
}


#copy data in from clipboard
a <- read.table("clipboard", sep =  "\t", header = T)
a <- read.table(file = "clipboard", sep = "t", header=TRUE)

read.excel <- function(header=TRUE,...) {
        read.table("clipboard",sep="\t",quote="",header=header,...)
}

dat=read.excel()

# write data to clipboard
write.excel <- function(x,row.names=FALSE,col.names=TRUE,...) {
        write.table(x,"clipboard",sep="\t",row.names=row.names,col.names=col.names,...)
}

write.excel(dat)


#lapply read csv
files <- list.files(pattern="*.csv", full.names=TRUE)
out <- do.call(rbind,lapply(files,read.csv,stringsAsFactors=FALSE))



# Tabular Data-------------------------------------------------
read.csv()
read.table() # Header=True, sep="," <Ex, stringsAsFactors=F/T --> code char vars as factors? (def: T)
?read.table
#reading in larger datasets (tips)
# use colClasses argument to specify field types
# figuring out column data classes
initial <- read.table("datatable.txt",nrows=100)
classes <- sapply(initial,class)
tabAll <- read.table("datatable.txt", colClasses = classes)

# EXCEL FILES_______________________________________________________________
##Reading in the Excel file------------------------------------------------
getwd()
setwd("/Users/Collier/Downloads/oesm15ma")
library(xlsx)
# install.packages("rjava")
library(rJava)
cameraData <- read.xlsx("MSA_M2015_dl.xlsx",sheetIndex=1,header=TRUE) #generic read sheet

#with rows/cols as Indexes--------------------------------
colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("cameras.xlsx",sheetIndex=1,colIndex=colIndex,rowIndex=rowIndex)# read specific rows & columns
cameraDataSubset

#xlConnect------------------------------------------------
require(XLConnect)
stocks <- loadWorkbook(file.choose())
stocks2 <-  readWorksheet(stocks, sheet = "stockprices", startRow = 50, endRow = 180, startCol = 1, endCol = 3) 
myts <- ts(stocks2, start = c(1991, 1), end = c(2005, 1))

# Fixed width file formats___________________________________________________
data <- read.fwf(file = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",
                 skip = 4,
                 widths = c(12, 7,4, 9,4, 9,4, 9,4))

# Textual Formats_________________________________________________
# ???

#Reading from other R Files_______________________________________
source()
dget #read in r code files
load() #for reading in saved workspaces
unserialize() #for reading single r objects in binary form

# DATABASES_________________________________________________
#mySQl connect example--------------------------------------
install.packages("RMySQL")
library(RMySQL)

##listing tables examples
ucscDb <- dbConnect(MySQL(), user="genome",host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb)
result

##Connecting to hg19(The connection String) and listing tables
hg19 <- dbConnect(MySQL(),user="genome",db="hg19",
                  host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables) #number of tables in the database
allTables[1:5]

##Get dimensions of a specific table (affyU133Plus2)
dbListFields(hg19,"affyU133Plus2") #tells us column names
dbGetQuery(hg19,"select count(*) from affyU133Plus2")

## Read from the table
affyData <- dbReadTable(hg19,"affyU133Plus2")
head(affyData)

##Select a specific subset
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query);quantile(affyMis$misMatches)
affyMisSmall <- fetch(query,n=10);dbClearResult(query);
dim(affyMisSmall)

##Remember to close the connection!!!
dbDisconnect(hg19)

# READING DATA FROM APIs______________________________
myapp = oauth_app("twitter",
                  key="yourConsumerKeyHere",secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp,
                    token = "yourTokenHere",
                    token_secret = "yourTokenSecretHere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
##Converting the json object
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

# READING DATA FROM WEB_______________________________
##RVEST Package
install.packages("rvest")
library(rvest)

url <- "https://www.fantasypros.com/nfl/reports/leaders/?year=2015&week=16"
population <- url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="data"]') %>%
  html_table()


population <- population[[1]]

head(population)

##Readlines-------------------------------------------
###Example 1
con <- url("http://www.jhsph.edu","r")
x <- readLines(con) 
head(x)
x <- readlines(10) #where 10 is the first 10 lines
###Example 2
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAA&J&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

####Parsing with XML----------------------------------
library(XML)
# Example 1
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url,useInternalNodes=T)
xpathSApply(html,"//title",xmlValue)
xpathSApply(html,"//td[@id='col-citedby']",xmlValue)

# GET from the HTTR Package----------------
library(httr);library(curl);html2=GET(url)
content2 = content(html2,as="text")
parsedHTML = htmlParse(content2,asText=TRUE)
xpathSApply(parsedHTML,"//title",xmlValue)

# Websites with Passwords (HTTR)
pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg1

pg2 = GET("http://httpbin.org/basic-auth/user/passwd",
          authenticate("user","passwd"))  #actual uid/pass for this website
pg2
names(pg2)

# Using Handles
google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search")

# Reading in XML-----------------------------------------
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
rootNode[[1]]
rootNode[[1]][[2]]
##Extracting parts of the XML file
xmlSApply(rootNode,xmlValue)

##XPATH for extracting specific components
xpathSApply(rootNode,"//name",xmlValue) #gets all nodes that have element title name & takes out value
xpathSApply(rootNode,"//price",xmlValue)

###Xpath example with HTML-----------------------------------
# Extract content by attributes
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternal=TRUE) #UseInteral=TRUE to get all nodes
scores <- xpathSApply(doc,"//li[@class='score']", xmlValue) #li = list items, class=score
teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue) #list item, class = team name
scores
teams

# DOWNLOADING FILES__________________________________________
# Download File From Web (CSV example)-----------------------
getwd()
setwd("C:\\Users\\Collier\\Dropbox\\Skills\\R\\Utilities-R\\Coursera_Getting_Cleaning_Data")
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD" #csv
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD" #xlsx
download.file(fileUrl, destfile = "cameras.csv") #csv
download.file(fileUrl, destfile = "cameras.xlsx") #xlsx
list.files("C:\\Users\\Collier\\Dropbox\\Skills\\R\\Utilities-R\\Coursera_Getting_Cleaning_Data")
dateDownloaded <- date()
dateDownloaded

#Zipped files
library(reshape2)
# Download and Extract Data

zipFile <- "dataset.zip"

## Download and unzip the dataset:
if (!file.exists(zipFile)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, zipFile, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(zipFile) 
}



#Reading in JSON-------------------------------------
install.packages("jsonlite")
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login
## Writing data frames to JSON
myJSON <- toJSON(iris,pretty=TRUE)
cat(myJSON)
## convert back from JSON
iris2 <- fromJSON(myJSON)
head(iris2)

# HDF5---------------------------------------------
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("example.h5")
created
##create groups within file
created = h5createGroup("example.h5","foo")
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")
##Write to specific groups within file
A = matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A")
B = array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B,"scale") <- "liter"
h5write(B,"example.h5","foo/foobaa/B")
h5ls("example.h5")
##Write to a data set
df = data.frame(1L:5L,seq(0,1,length.out=5),
                c("ab","cde","fghi","a","s"),stringsAsFactors = FALSE)
h5write(df,"example.h5","df")
h5ls("example.h5")
##Reading the data
readA = h5read("example.h5","foo/A")
readB = h5read("example.h5","foo/foobaa/B")
readdf = h5read("example.h5","df")
readA
# Writing and Reading in Chunks
h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3,1))
h5read("example.h5","foo/A")

#WORKING with COLUMN HEADERS--------------------------------------------
#when headers are imported as V1,V2, etc...we need to assign column names
# column names come from first line in file
cnames <- readlines("RD_501_88101_1999-0.txt",1)
cnames <- strsplit(cnames, "|", fixed = TRUE) #returns a list back
names(pm0) <- cnames[[1]] #assign data frame names from first element of list
##make unique columns without spaces
?make.names

#WRITING DATA-----------------------------------------
write.table()
write.csv()
write.xlsx()
write.xlsx2()
library(xlsx)
x <- sample(1:100)
write.xlsx(x,file="C:\\Users\\Collier\\Documents\\Rprojects\\test.xlsx",sheetName="test")


#Knitr output of markdown
library(knitr)
knit2html("PA1_template.md")






#Excel files with readxl package