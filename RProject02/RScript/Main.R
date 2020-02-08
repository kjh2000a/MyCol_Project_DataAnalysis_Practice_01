##############################
#
##############################

##### Install
install.packages()

##### Library
library(tidyverse)
library(scales)
library(stringr)
library(readr)
library(readxl)
library(ggplot2)

##### Global Var 1
gstr_OriginPath <- './Data/OriginalData/'
gstr_FixedPath <- './Data/FixedData/'
gv_Extension <- c(csv = '.csv', xlsx = '.xlsx', xls = '.xls')

##### Global Var 2
glist_Data <- list()
