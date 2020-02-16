##############################
# 함수 - 라이브러리
##############################

#--------------------------------------------------

##### 라이브러리 함수
func_Lib <- function(){
  #library(tidyverse)
  library(readr)    # 로드
  library(readxl)   # 로드

  library(stringr)  # 문자형 데이터 제어
  
  library(tibble)   # tibble 데이터 구조형 지원
  library(forcats)  # factor 데이터 구조형 제어
  
  library(dplyr)    # 데이터 구조형 제어 - select, filter, mutate, arrange, summarise 등
  library(tidyr)    # 데이터 구조형 제어 - separate, unite, gather, spread 등
  
  library(purrr)    # 함수형 프로그래밍 지원
  
  library(ggplot2)  # 그래프 시각화
  
  print("라이브러리 로딩 완료")
}

#--------------------------------------------------
