##############################
#메인 스크립트
##############################

#----------

##### 인스톨
install.packages()

#----------

##### 라이브러리
library(tidyverse)
library(scales)
library(stringr)
library(readr)
library(readxl)
library(ggplot2)

#----------

##### 전역 변수 - 경로
gstr_OriginPath <- './Data/OriginalData/'
gstr_FixedPath <- './Data/FixedData/'
gv_Extension <- c(csv = '.csv', xlsx = '.xlsx', xls = '.xls')

##### 전역 변수 - 데이터 리스트
gl_Data <- list()

#----------
