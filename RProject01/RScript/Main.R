##############################
#
##############################

##### install
install.packages()

##### library
library(tidyverse)
library(readxl)
library(stringr)

##### Global Var
#----
str_FixedPath <- './Data/FixedData/'
str_OriginPath <- './Data/OriginalData/'
v_Extension <- c(csv = '.csv', xlsx = '.xlsx', xls = '.xls')
#---- 
list_DataBase <- list()