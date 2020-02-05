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
gstr_FixedPath <- './Data/FixedData/'
gstr_OriginPath <- './Data/OriginalData/'
gv_Extension <- c(csv = '.csv', xlsx = '.xlsx', xls = '.xls')
#---- 
glist_DataBase <- list()
