##############################
# 날씨 데이터 정제
##############################

#----------

##### 이름 정제

### 기온

# 전국
names(gl_Data$l_Weather$l_Temper$df_Temper_Nationwide) <-
  c('region_number', 'region_name', 'DateYYYYMM', 'TAver', 'TAverHigh',
    'THigh', 'THighName', 'TAverLow', 'TLow', 'TLowName')

# 서울
names(gl_Data$l_Weather$l_Temper$df_Temper_Seoul) <-
  c('region_number', 'region_name', 'DateYYYYMM', 'TAver', 'TAverHigh',
    'THigh', 'THighDateYYYYMMDD', 'TAverLow', 'TLow', 'TLowDateYYYYMMDD')

### 강수량

# 전국
view(gl_Data$l_Weather$l_Rain$df_Rain_Nationwide)
names(gl_Data$l_Weather$l_Rain$df_Rain_Nationwide) <-
  c('region_number', 'region_name', 'DateYYYYMM', 'RAver', 'RHigh',
    'RHighName', 'RHigh1Hour', 'RHigh1HourName')

# 서울
names(gl_Data$l_Weather$l_Rain$df_Rain_Seoul) <-
  c('region_number', 'region_name', 'DateYYYYMM', 'RAver', 'RHigh',
    'RHighDateYYYYMMDD', 'RHigh1Hour', 'RHigh1HourDateYYYYMMDD')

#----------

##### NA 정제

### 강수량

# 전국
gl_Data$l_Weather$l_Rain$df_Rain_Nationwide[c('RHigh1Hour', 'RHigh1HourName')][is.na(gl_Data$l_Weather$l_Rain$df_Rain_Nationwide[, c('RHigh1Hour', 'RHigh1HourName')])] <- 0
