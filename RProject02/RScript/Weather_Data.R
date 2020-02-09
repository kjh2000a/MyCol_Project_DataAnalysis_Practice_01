##############################
# 날씨 데이터 관리
##############################

#----------

##### 리스트 생성 -> 연결

### 날씨 리스트
gl_Data[[length(gl_Data) + 1]] <- list()
names(gl_Data)[[length(gl_Data)]] <- 'l_Weather'

### 기온 리스트
gl_Data$l_Weather[[length(gl_Data$l_Weather) + 1]] <- list()
names(gl_Data$l_Weather)[[length(gl_Data$l_Weather)]] <- 'l_Temper'

### 강수량 리스트
gl_Data$l_Weather[[length(gl_Data$l_Weather) + 1]] <- list()
names(gl_Data$l_Weather)[[length(gl_Data$l_Weather)]] <- 'l_Rain'

#----------

##### 데이터 로드 -> 데이터 프레임 연결

### 기온

# 전국
gl_Data$l_Weather$l_Temper[[length(gl_Data$l_Weather$l_Temper) + 1]] <- 
  readxl::read_excel(stringr::str_c(gstr_FixedPath, stringr::str_c('전국_기온_2010_2019', gv_Extension['xlsx'])), skip = 12)
names(gl_Data$l_Weather$l_Temper)[[length(gl_Data$l_Weather$l_Temper)]] <- 'df_Temper_Nationwide'

# 서울
gl_Data$l_Weather$l_Temper[[length(gl_Data$l_Weather$l_Temper) + 1]] <-
  read_excel(stringr::str_c(gstr_FixedPath, stringr::str_c('서울_기온_2010_2019', gv_Extension['xlsx'])), skip = 11)
names(gl_Data$l_Weather$l_Temper)[[length(gl_Data$l_Weather$l_Temper)]] <- 'df_Temper_Seoul'


### 강수량

# 전국
gl_Data$l_Weather$l_Rain[[length(gl_Data$l_Weather$l_Rain) + 1]] <- 
  readxl::read_excel(stringr::str_c(gstr_FixedPath, stringr::str_c('전국_강수량_2010_2019', gv_Extension['xlsx'])), skip = 13)
names(gl_Data$l_Weather$l_Rain)[[length(gl_Data$l_Weather$l_Rain)]] <- 'df_Rain_Nationwide'

# 서울
gl_Data$l_Weather$l_Rain[[length(gl_Data$l_Weather$l_Rain) + 1]] <-
  read_excel(stringr::str_c(gstr_FixedPath, stringr::str_c('서울_강수량_2010_2019', gv_Extension['xlsx'])), skip = 13)
names(gl_Data$l_Weather$l_Rain)[[length(gl_Data$l_Weather$l_Rain)]] <- 'df_Rain_Seoul'

#----------