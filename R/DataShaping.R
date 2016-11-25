# COLUMN AND ROW NAMES-------------------------------------------------
##column names--------------------------------------
x <- strsplit(cnames,"|",fixed=T)
#gives list of column names
xnames <- readlines("FilePath....",1)
#makes object for colnames
names(x) <- make.names(cnames([1])
dim(x)

# another examples of making names
cnames <- c("patient","age","weight","bp","rating","test")
colnames(my_data) <- cnames #where cnames is the data frame

#gives records & columns
cnames <- strsplit(cnames,"|",TRUE)
names(pm0) <- make.names(cnames[[1]][wcol])
# list names
x <- list(a=1,b=2,c=3)
# matrix names
m <- matrix(1:4,nrow=2,ncol=2)
dimnames(m) <- list(c("a","b"),c("c","d"))
m
# vector names
x <- 1:3
names(x) <- c("foo","bar","norf")
names(x)
names(vect2) <- c("foo","bar","norf")
# Row names-----------------------------------------

# FACTORS-------------------------------------------
x <- factor(c("yes","no","yes"))
x
table(x)
unclass(x)
x <- factor(c("yes","no","yes","no"), levels=c("yes","no"))
x

#RANDOMIZATION
# The sample() function draws a random sample from the data provided as its first argument (in this case c(y, z)) of the size specified by the second argument (100)

# MISSING DATA------------------------------------------------------
#------------------------------------------------------------------
x <- c(1,2,NA,4,NA,5)
bad <- is.na(x)
x[!bad]
mean(is.na(x0)) #gives us a % of NAs
is.nan(x)
y <- x[!is.na(x)] #select not missing values in a vector

#Looking at each column
apply(statCereals, 2, function(x) mean(is.na(x)))


## dataframe checks
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode>0)

# my_data==NA

complete.cases
good <- complete.cases(x)
x[good,][1:5,]

# Negative values in data
negative <- x1<0 # create variable where your vector value is less than 0
sum(negative,na.rm=TRUE)   #gives us total               
mean(negative,na.rm=TRUE) #gives us a %
table(factor(is.na(x$Ozone)))
mean(x$Ozone[!is.na(x$Ozone)])

# subset for positive and not N/A
x[!is.na(x)&x>0]


# TEXT VARIABLES------------------------------------------------------------
# --------------------------------------------------------------------------
#Setting cases
tolower(names(cameraData)) 
tolower(names(cameraData)) 

#Splitting variable names
splitNames = strsplit(names(cameraData),"\\.") 
splitNames[[5]]
splitNames[[6]]
#Take the first part of the name (before the period w/ sApply)
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)

#SUB command------
##for pattern replacement (replaces only first pattern)
names(reviews)
sub("_","",names(reviews),) #Important parameters: _pattern_, _replacement_, _x_

#GSUB command------
## replaces all patterns you specify
testName <- "this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

#trailing spaces
# returns string w/o leading whitespace
trim.leading <- function (x)  sub("^\\s+", "", x)

# returns string w/o trailing whitespace
trim.trailing <- function (x) sub("\\s+$", "", x)

# returns string w/o leading or trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x)


# GREP--------------
##Find values
grep("Alameda",cameraData$intersection)
table(grepl("Alameda",cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]

##specify value = true to return values
grep("Alameda",cameraData$intersection,value=TRUE)
grep("JeffStreet",cameraData$intersection)
length(grep("JeffStreet",cameraData$intersection))  #if length is 0, then value didnt appear in our search

# STRINGR---------------
library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek",1,7) 
paste("Jeffrey","Leek") #concat
paste0("Jeffrey","Leek") #concat no spaces
str_trim("Jeff      ") #trim excess spaces

# REGULAR EXPRESSIONS---------------
^text #matches beginning of line
text$ #matches end of line
        [Bb] #matches all versions containing lowercase or capital "b"
^[Ii] am #combines these conditions together
^[0-9][a-zA-Z] #matches anything in the range specified
[^?.]$ #match lines that do not end in question mark or period
        9.11 #matches anything with a "9" and an "11" separated by 1 character
flood|fire #matches lines with either flood or fire
^[Gg]ood|[Bb]ad #matches begining of line with capital pr lowercase "good" or anywhere in the line "bad"
^([Gg]ood|[Bb]ad) #matches "good" or "bad" at beginning of the line
[Gg]eorge( [Ww]\.)? [Bb]ush #here we are looking for "George Bush" with the Optional (via "?") W in the middle 
(*.*) #searching for something between parenthesis, for any character repeated any number of times
[0-9]+ (.*)[0-9]+ #we look for atleast ("+") 1 number followed by any number of chars, followed by alteast 1 number again
        [Bb]ush( +[^ ]+ +){1,5} debate #specify the min and max number of matches on an expression (space, word, space)-betw 1 and 5 times
+([a-zA-Z]+) +\1 + #matches a phrase, plus a space, followed by the exact same phrase (ex: "night night")
        ^s(.*)s #* always matches longest string that satisfies reg expression, here look for word that starts with s, followed by any amount of #s, ending in s
^s(.*?)s$ #greedines can be turned off with the ? --> now it doesnt always return the maxiumum string
        
        ## Examples
        dat2 <- dat[grep("^Odell",dat$Player),]
dat2 <- dat[grep("\\bOdell",dat$Player), ] #entire word
dat2 <- dat[grepl("\\bDavid J",dat$Player) &
                    grepl("RB",dat$Position),]

# WORKING WITH DATES---------------------------------------------------
# -------------------------------------------------------------------
##Date class
d2 = Sys.Date()
class(d2)
## Formatting Dates
format(d2,"%a %b %d")

## Creating Dates
x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960"); z = as.Date(x, "%d%b%Y")
z
z[1] - z[2]
as.numeric(z[1]-z[2])

## Converting Dates
weekdays(d2)
months(d2)
julian(d2)

# LUBRIDATE package-----------
library(lubridate); 
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")
## Dealing with times
ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03",tz="Pacific/Auckland")
?Sys.timezone

# Base dates
x = dmy(c("1jan2013", "2jan2013", "31mar2013", "30jul2013"))
wday(x[1])
wday(x[1],label=TRUE)

## Transform dates
dates <- pm1$Date
str(dates)
# int [1:1304287] 20120101
dates <- as.Date(as.character(dates),"%Y%m%d")
head(dates)
# [1] "2012-01-01"
hist(dates[negative],"month") #shows us a hist of the months with negative dates



# INTERSECTIONS, SELECTIONS & JOINS----------------------------------------------
# --------------------------------------------------------------------
#INTERSECT - create an object from the intersections of other objects
both <- intersect(site0,site1) # where site0 and site1 arevectors

#SUBSETTING-------------------------
set.seed(13435)
# scramble/sample the data
x <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x <- x[sample(1:5),]
x$var2[c(1,3)] = NA
x[,1]
x[,"var1"]
x[1:2,"var2"]
# Logicals AND / OR
x[(x$var1<=3 & x$var3 > 11),] #AND
x[(x$var1<=3 | x$var3 > 15),]  #OR
#dealing with NAs
x[which(x$var2>8),] #doesnt return NAs which might otherwise be returned by our logic

#WHICH
# search for index of a DF that matches values in another
matches <- which(input$date %in% callBuys$TradeDate)

#select items based on multiple criteria with &
cnt0 <- subset(pm0,State.Code == 36 & county.site %in% both) #where both is a vector of values ...need more examples of this
pm0sub <- subset(cnt0,County.Code == 63 & Site.ID == 2008) #select based on 2 criteria
# With just brackets
# single brackets return objects of same class
# double brackets return single elements from data frame or list
x <- c("a","b","c")
x[x>"a"]

x <- list(foo=1:4,bar=0.6)
x[1]
x[[1]]
x$bar
x["bar"]  #is the same as x$bar
x[["bar"]]
x["bar"]

# subset all elements of a vector except 2 and 10
x[c(-2,-10)] #or
x[-c(2,10)]

##Subset with conditions
good <- complete.cases(x$Ozone,x$Solar.R,x$Temp)
mean(x$Solar.R[good & x$Ozone > 31 & x$Temp > 90])

good <- complete.cases(x$Month,x$Temp)
mean(x$Temp[good & x$Month==6])

max(x$Ozone[x$Month==5 & !is.na(x$Ozone)])

#SORTING-----------------------
sort(x$var1)
sort(x$var1,decreasing=TRUE)
sort(x$var2,na.last = TRUE)

# ORDERING BY-------------------
x[order(x$var1),] #single variable
x[order(x$var1,x$var3),] #multible variables

QB.FinalList[order(QB.FinalList$CompRank),]

##Ordering with Plyr package
library(plyr)
arrange(x,var1)
arrange(x,desc(var1))


# RANKING 

RI_Ranks <- data.frame(pplRI, t(apply(-pplRI, 1, rank, ties.method='min')))
#pplRI is the data frame



#Adding Rows and Columns to Data Frame ----------------------
x$var4 <- rnorm(5)
##cbind command
y <- cbind(x,rnorm(5)) #rbind for rows


#Matrix Multiplication--------------------------
y %*% x

#MERGING________________________________________________________________

#Match 
dataframe2$planName <- planNames$Population[match(dataframe2$CURRENT_PLAN_NAME,planNames$Plan.Name)]
# Vlookup equialent
termDB_6$Plan.Name <- plans$Population[match(termDB_6$CURRENT_PLAN_NAME,plans$Plan.Name)]

# Apply a join to several data frames based on a key field
mrg <- merge(d0,d1,by="state")

##Example: peer review expiriment data

if(!file.exists(".//Data")){dir.create("/Data")}
fileUrl1="https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2="https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile = "./Data/reviews.csv",method="curl")
download.file(fileUrl2,destfile = "./Data/solutions.csv",method="curl")
reviews=read.csv("./Data/reviews.csv");solutions<-read.csv("./Data/solutions.csv")
head(reviews,2)
head(solutions,2)
##merge the data
names(reviews)
names(solutions)
##tell merge which variables to merge on
mergedData <- merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE) #all = TRUE --> outer join
dim(mergedData)
head(mergedData)
mergedData <- merge(reviews,solutions,by.x="solution_id",by.y="id",all=FALSE) #all = FALSE --> inner join
dim(mergedData)

##Default Setting - merge all common column names
intersect(names(solutions),names(reviews))
mergedData2 <- merge(reviews,solutions,all=TRUE) #only the first matching column will be used to match
dim(mergedData2)

# PLYR package joins------------------
##faster but less featured - defaults to left join
df1 <- data.frame(id=sample(1:10),x=rnorm(10))
df2 <- data.frame(id=sample(1:10),y=rnorm(10))
arrange(join(df1,df2),id) #arrange by increasing order by ID
##multiple dataframes
df1 <- data.frame(id=sample(1:10),x=rnorm(10))
df2 <- data.frame(id=sample(1:10),y=rnorm(10))
df3 <- data.frame(id=sample(1:10),z=rnorm(10))
dfList <- list(df1,df2,df3)
dfList
join_all(dfList)


# LOOPING FUNCTIONS_____________________________________________________

# LAPPLY-------------------------
# lapply always returns a list
x <- list(a=1:5,b=rnorm(10))
lapply(x,mean)

x <- list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
lapply(x,mean)

x <- 1:4
lapply(x,runif) #applies runif to sequence 1,2,3,4

x <- 1:4
lapply(x,runif,min=0,max=10) #random uniforms now between 0 and 10

# lapply and friends make heavy use of anonymous functions (functions w/o names)
##create 2 matrices
x <- list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
x
##create an anonymous function for extracting the first column of each matrix
lapply(x,function(ad) ad[,1]) #where "ad" is a random function name i made up

# APPLY-------------------------
x <- matrix(rnorm(200),20,10)
apply(x,2,mean) #cols

apply(x,1,sum) #rows

x <- matrix(rnorm(200),20,10)
apply(x,1,quantile,probs=c(0.25,0.75)) #calcs 25th and 75th pctile per row

#avg matrix in an array
a <- array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)

rowMeans(a,dims=2)

#MAPPLY-------------------------
# used to apply a function to multiple sets of arguments
mapply(rep,1:4,4:1)
# example, create args
noise <- function(n,mean,sd){
        rnorm(n,mean,sd)
}

noise(5,1,2)
noise(1:5,1:5,2) #<--this function doesnt work with vectors
mapply(noise,1:5,1:5,2) #this is the same as:
list(noise(1,1,2),noise(2,2,2),noise(3,3,2),noise(4,4,2),noise(5,5,2))

library(ExplainPrediction)
?ExplainPrediction

#SAPPLY-------------------------
# Sapply VS Lapply -- Sapply can return vectors where lapply only returns lists
##often we want to work with vectors rather than lists
sapply(x,mean)

x <- list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
lapply(x,mean)
mean(x)  #<- error because mean not meant to be applied to lists

# sapply continued....
# #apply another command to data
# This will split cnt0 into several data frames according to county.site 
# and tell us how many measurements each monitor recorded.
sapply(split(cnt1,cnt1$county.site),nrow)
# 1.12     1.5   101.3   13.11    29.5    31.3    5.80 63.2008 67.1015   85.55 
# 61     122     152      61      61     183      61     122     122       7


# TAPPLY------------------------
# ex: take group means
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
f

?gl 

tapply(x,f,mean)
tapply(x,f,mean,simplify = FALSE) #returns as list
# ex: find group ranges
tapply(x,f,range)


mn0 <-with(pm0,tapply(Sample.Value,State.Code,mean,na.rm=TRUE))
# We want to apply the function mean to Sample.Value, so mean is the third argument. The
# fourth is simply the boolean na.rm set to TRUE.
#creates a vector of our calculations

#SPLIT --------------------
#split takes a vector of other objects and splits it into groups determined by a factor
# or list of factors

str(split) #split x by f factors, can these use lapply or sapply to apply function to groups
# ex: 
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
split(x,f)

#ex2: common to use split & lapply together
lapply(split(x,f),mean) #returns the same as tapply (below)
tapply(x,f,mean, simplify = FALSE)

# Advantage of Split comes when splitting more complicated types of objects
library(datasets)
data("airquality")
head(airquality)
#ex3: Splitting a data frame
s <- split(airquality, airquality$Month)
#take column mean for three variables below
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
#dealing with missing values....use Sapply to put into a matrix instead of list
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm=TRUE))

##Splitting on more than 1 level (more than 1 factor: ex Gender or Race)
##look at combination of levels within that factor
# ex1: 
x <- rnorm(10)
f1 <- gl(2,5) #factor with 2 levels, rep 5 times
f2 <- gl(5,2) #factor with 5 levels, rep 2 times
f1

interaction(f1,f2) #combines all levels in first factor with 2nd factors levels
2 *5 #ending factors

# can skip using interaction if we use split
str(split(x,list(f1,f2)))
#returns list with levels of interactions
str(split(x,list(f1,f2),drop=TRUE))
#returns list with levels of interactions, W/O empty levels

##LIST TO DATA FRAME
data.frame(
  Category = rep(names(callsX), lapply(callsX, length)),
  Value = unlist(callsX))



# DATA FRAMES (Statistical Summaries)----------------------------------------------------
#----------------------------------------------------------------------------------------
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv",method="curl")
restData <- read.csv("./data/restaurants.csv")

getwd()

# descriptive
head(restData)
tail(restData)
str(restData)


# statistical summaries
outlierDat <- apply(statCereals, 2, function(x) boxplot.stats(x)$out)

listLen <- length(outlierDat)

outlierDat2 <- as.data.frame(as.matrix(unlist(outlierDat),ncol=2,nrow=listLen))

#OR

x <- sapply(statCereals,boxplot.stats)

library()
library(pastecs)

stat.desc(statCereals)

summary(restData)
quantile(restData$councilDistrict,na.rm=TRUE)
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))


#TABLE Summaries_________________________________
##size of data set
fakeData=rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")


table(restData$zipCode,useNA="ifany") #if any missing values, add column called NA w. # ofmissing values
## make 2d table to see relationship/distribution
table(restData$councilDistrict,restData$zipCode)
##rows and column sums
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

## Table for values with specific characteristics
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),] #create subset on conditions

##CROSS Table Summaries__________________________________
data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
summary(DF)
###Xtabs to id relationships
xt <- xtabs(Freq~Gender+Admit,data=DF)
xt
###Flat tables
warpbreaks$replicate <- rep(1:9,len=54)
xt = xtabs(breaks~.,data=warpbreaks)
xt
###Flat tables compacts (flattens the cross tables) into 1 set
ftable(xt)

# Putting aggregations or statistics into new data frames
d1 <- data.frame(state=names(mn1),mean=mn1)

# comparison within dataframe objects
mrg[mrg$mean.x<mrg$mean.y,] #this returns a list within the specified dataframe which meets the condition
# state    mean.x    mean.y
# 6     15  4.861821  8.749336
# 23    31  9.167770  9.207489
# 27    35  6.511285  8.089755
# 33    40 10.657617 10.849870

##Aggregate function
aggregate(x)


# CREATING NEW VARIABLES------------------------------------------------------------------
##Sometimes we need to create new variables to supplement the raw data
##We will need to transform the data to get the values we want

#Creating Sequences
s1 <- seq(1,10,by=2);s1
s2 <- seq(1,10,length=3);s2
x <- c(1,3,8,25,100);seq(along=x) #creates an index

#Subsetting data for new variables
restData$nearMe <- restData$neighborhood %in% c("Roland Park","Homeland")
table(restData$nearMe)

#Creating Binary variables
restData$zipWrong <- ifelse(restData$zipCode <0, TRUE, FALSE)
table(restData$zipWrong,restData$zipCode<0)

#Creating Categorical variables
restData$zipGroups <- cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups,restData$zipCode)

##Cat variables -- Easier Way with Hmisc package*
library(Hmisc)
###Cutting produces factor variables
restData$zipGroups <- cut2(restData$zipCode,g=4)
table(restData$zipGroups)
###Mutate function - creates new DF and adds new version of variables at same time
library(Hmisc);library(plyr)
restData2 <- mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData$zipGroups)

#Creating Factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)
##Levels of factor variables
yesno <- sample(c("yes","no"),size=10,replace=TRUE)
yesnofac <- factor(yesno,levels=c("yes","no"))
relevel(yesnofac,ref="yes")
as.numeric(yesnofac)

# DATA TABLE PACKAGE---------------------------------------------------------------------
## Create data tables just like data frames
library(data.table)
##creata a data frame example
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)
##creata a data table example (same way)
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

##See all the tables in memory
tables()

## Subsetting rows
DT[2,]
DT[DT$y=="a",] #access only values of Y that are = to "a"
###Difference from data.frames....it subsets based on rows
DT[c(2,3)]
## Subsetting columns (very different from same task using data.frames)
DT[,c(2,3)]



##Calculating values for variables with expressions
DT[,list(mean(x),sum(z))]
DT[,table(y)]

##Adding new columns
DT[,w:=z^2] # ":=" creates the new column
DT2 <- DT
DT[, y:=2]
#be careful to use copy function because when we assign a data table to another, 
#changes to the first will affect the 2nd
head(DT,n=3)
head(DT2,n=3)

# Multiple Operations
DT[,m:={tmp <- (x+z); log2(tmp+5)}]

# plyr like operations
DT[,a:=x>0]
DT[,b:=mean(x+w),by=a]

# Special variables
set.seed(123);
DT <- data.table(x=sample(letters[1:3],1E5,TRUE))
DT[,.N,by=x]

# Keys
DT <- data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))
setkey(DT,x)
DT['a']

#Joins
DT1 <- data.table(x=c('a','a','b','dt1'),y=1:4)
DT2 <- data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT1,x);setkey(DT2,x)
merge(DT1,DT2)

# Fast-Reading
big_df <- data.frame(x=rnorm(1E6),y=rnorm(1E6))
file <- tempfile()
write.table(big_df,file=file,row.names=FALSE,col.names=TRUE,sep="\t",quote=FALSE)
system.time(fread(file))
system.time(read.table(file,header=TRUE,sep="\t"))

# COMMON TRANSFORMATIONS_________________________________________________
abs(x)
sqrt(x)
ceiling(x)
floor(x)
round(x,digits=n)
signif(x,digits=n)
cos(x)
sin(x)
log(x)
log2(x)
log10(x)
exp(x)

# RESHAPING DATA_______________________________________________________
##example with mtcars dataset

library(reshape2)
head(mtcars)
#we define which of vars are "id variables" and which are "measure variables"
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)
#casting the data frames
cylData <- dcast(carMelt,cyl~variable) #dcast recasts data set into particular shape/frame
cylData
cylData <- dcast(carMelt,cyl~variable,mean) #summarizes by mean
cylData

##Averaging Values : InsectSprays dataset example
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum) #apply count along an index (spray) the function (sum)
###Another way : split
spIns <- split(InsectSprays$count,InsectSprays$spray)
spIns #returns list of values for each type of spray
sprCount <- lapply(spIns,sum)#now apply a function across that list
sprCount
###Another way : combine
unlist(sprCount)
sapply(spIns,sum) #does both apply and combine steps at same time
##Another way: plyr package
###summarize this variable by summing count
library(plyr);library(dplyr)
data("InsectSprays")
ddply(InsectSprays,.(spray),summarize,sum=sum(count))
# spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum)) #<--code error
# dim(spraySums)
# head(spraySums)

# DPLYR PACKAGE_________________________________________________________
##chicago data demo
library(dplyr)
chicago <- readRDS("C:\\Users\\Collier\\Dropbox (Personal)\\Skills\\R\\Intro to R\\data\\chicago.rds")
dim(chicago)
str(chicago)
names(chicago)
# SELECT-------------
# return a subset of columns from a data frame (we can use names directly)
head(select(chicago,city:dptp)) #select only columns between city & dptp
head(select(chicago,-(city:dptp)))
##alternative method in base r (harder)
i <- match("city",names(chicago))
j <- match("dptp",names(chicago))
head(chicago[,-(i:j)])

# FILTER----------- 
# extract a subset of rwos from a data frame based on logical conditions
chic.f <- filter(chicago,pm25tmean2 > 30) #select only rows where pm25mean2 > 30
head(chic.f,10)
chic.f <- filter(chicago,pm25tmean2 > 30 & tmpd > 80)
head(chic.f)

#Filtering out items on multiple criteria
FinalList2 <- FinalList2[!(FinalList2$Player=="Alex Smith" & FinalList2$Position=="TE"),]


#more examples--
filter(cran,country=="US"|country=="IN")
filter(cran,r_version <= "3.0.2", country=="IN")
filter(cran,size > 100500, r_os == "linux-gnu")
filter(cran,!is.na(r_version))



# ARRANGE----------
# reorder rows of a data fraame
chicago <- arrange(chicago,date)
head(chicago)
tail(chicago)
chicago <- arrange(chicago,desc(date))
head(chicago)
tail(chicago)

# RENAME-----------
# rename variables in a data frame
chicago <- rename(chicago,pm25=pm25tmean2,dewpoint=dptp)
head(chicago)
tail(chicago)

# MUTATE-----------
# add new variables/columns or transform existing variables
# create new variable based on the value of 1 or more variables already in a dataset
chicago <- mutate(chicago,pm25detrend=pm25-mean(pm25,na.rm = TRUE))
head(select(chicago,pm25,pm25detrend))

# other examples
mutate(cran3,size_mb=size/2^20)
# use the value computed for your second column (size_mb) to
# create a third column, all in the same line of code
mutate(cran3,size_mb=size/2^20, size_gb = size_mb/2^10)


# SUMMARIZE--------
# generate summ. statistics of different variables in the data frame, possibly within strata
## example: make hot/cold variable to summarize against
chicago <-mutate(chicago,tempcat=factor(1*(tmpd>80),labels=c("cold","hot")))
hotcold <- group_by(chicago,tempcat)
hotcold
summarize(hotcold,pm25=mean(pm25),o3=max(o3tmean2),no2=median(no2tmean2))
summarize(hotcold,pm25=mean(pm25,na.rm=TRUE),o3=max(o3tmean2),no2=median(no2tmean2))
##summary for each year
chicago <- mutate(chicago,year=as.POSIXlt(date)$year+1900)
years <- group_by(chicago,year)
summarize(years,pm25=mean(pm25,na.rm=TRUE),o3=max(o3tmean2),no2=median(no2tmean2))

#more examples 1
summarize(cran,avg_bytes=mean(size))
# CHAINING OPERATIONS TOGETHER----------
##take dataset and feed it through a pipeline of operations to create a new dataset
##Steps::
##mutate data to create summary of vars by month %>% take output and and group_by month #take output of groupby and run it throug summarize
chicago %>% mutate(month=as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarize(pm25=mean(pm25,na.rm = TRUE),o3=max(o3tmean2),no2=median(no2tmean2))
#the end result of this operation is a DF shows us summ stats of poll variables by each month in year

#more examples 2
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  # Your call to filter() goes here
  filter(size_mb<=0.5) %>%
  arrange(desc(size_mb)) %>%
        print

##SUMIFs examples
#Aggregate

#where i s the criteria and Rating is the aggregation field

avgRating <- aggregate(as.formula(paste0("Rating~",i)),clubtbl,mean)
attrSumm$avgRating <- avgRating[avgRating[i]==1,][2]

attrCount <- aggregate(as.formula(paste0("Rating~",i)),clubtbl,length)
attrSumm$attrCount <- attrCount[attrCount[i]==1,][2]






#dplyr
library(dplyr)

names <- c("a", "b", "c", "d", "a", "b", "c", "d")
x <- cbind(x1 = 3, x2 = c(3:10))
total <- data.frame(names, x)
total

x <- total %>%
  group_by(names) %>%
  summarise(Sumx1 = sum(x1), Sumx2 = sum(x2))

# names Sumx1 Sumx2
# 1     d     6    16
# 2     c     6    14
# 3     b     6    12
# 4     a     6    10

totalStepsByDate <- activitiesByDate %>% summarise(totalSteps = sum(steps, na.rm = TRUE))
# OR COULD DO
dailyactivity <- tapply(activity$steps, activity$date, sum, na.rm = TRUE)

#bind_rows------------
?bind_rows
bind_rows(passed,failed)

# **there is also a handy print method that prevents you from printing a lof of data to the console
# TBL_DF------------------------
# tbl_df vs reg DF-----
cran <- tbl_df(mydf)
cran #the results are much more informative
##we are shown the class and dimensions of the dataset...shows top 10 rows

# TIDYR_____________________________________________
install.packages("tidyr")
library(tidyr)
?gather
# gather(data, key, value
gather(students,sex,count,-grade) 
#Each row of the data now represents exactly one observation, 
#characterized by a unique combination of the grade and sex

# The data argument, students, gives the name of the original dataset. 
# The key and value arguments -- sex and count, respectively -- give the column names for our tidy dataset.
# The final argument, -grade, says that we want to gather all columns EXCEPT the grade column (since grade is already a proper column variable.)

?separate
separate(res, col = sex_class , into=c("sex","class"))
?spread
extract_numeric("class5") # makes class5 --> 5

## Chained example 2
# Accomplish the following three goals:
#
# 1. select() all columns that do NOT contain the word "total",
# since if we have the male and female data, we can always
# recreate the total count in a separate column, if we want it.
# Hint: Use the contains() function, which you'll
# find detailed in 'Selection' section of ?select.
#
# 2. gather() all columns EXCEPT score_range, using
# key = part_sex and value = count.
#
# 3. separate() part_sex into two separate variables (columns),
# called "part" and "sex", respectively. You may need to check
# the 'Examples' section of ?separate to remember how the 'into'
# argument should be phrased.
# Append two more function calls to accomplish the following:
#
# 1. Use group_by() (from dplyr) to group the data by part and
# sex, in that order.
#
# 2. Use mutate to add two new columns, whose values will be
# automatically computed group-by-group:
#
#   * total = sum(count)
#   * prop = count / total
#
sat %>%
        select(-contains("total")) %>%
        gather(part_sex, count, -score_range) %>%
        separate(part_sex, c("part", "sex")) %>%
        group_by(part,sex) %>%
        mutate(total=sum(count), prop=count/total) %>% print

##Remove duplicates

df[!duplicated(df), ]

##Re order columns
#move column to first position
data[,c(ncol(data),1:(ncol(data)-1))]

# Re-order columns
n <- 5
x <- data.frame(Product = sample(letters, n), Cost = rnorm(n), Sales = sample(1:10, n))
y <- data.frame(Cost = rnorm(n), Sales = sample(1:10, n), Product = sample(letters, n))
x
y
cnames<- colnames(x)
y <- y[ , cnames]
y

#Make data frame from list
df <- data.frame(
  Category = rep(names(putsX), lapply(putsX, length)),
  Value = unlist(putsX),row.names = NULL,stringsAsFactors = FALSE)