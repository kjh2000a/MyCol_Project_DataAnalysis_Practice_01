##############################
# 데이터 관리
##############################

#---------------------------------

##### 생성
gl_Data[[length(gl_Data) + 1]] <- list()
names(gl_Data)[[length(gl_Data)]] <- 'l_Causeofdeath'

#---------------------------------

##### 로드
gl_Data$l_Causeofdeath[[length(gl_Data$l_Causeofdeath) + 1]] <-
  readxl::read_excel(path = stringr::str_c( gstr_RootPath, 
                                            stringr::str_c( gstr_FixedPath, 
                                                            stringr::str_c( 'Causeofdeath_Sigun_Sex_Year', 
                                                                            gv_Exten['xlsx']) ) ),
                     col_types = c('text', 'text', 'text', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
                     na = ('-'),
                     skip = 1)
names(gl_Data$l_Causeofdeath)[[length(gl_Data$l_Causeofdeath)]] <- 'df_Cod_SigunSexYear'

#---------------------------------

##### 이름 정제
vd <- c('Cause', 'Sigun', 'Sex')
vs <- c('_DCount', '_DPer', '_DPerAge')
p <- 0
n <- length(vd)
for(i in 1:ncol(gl_Data$l_Causeofdeath$df_Cod_SigunSexYear)){
  if(i <= 3){
    next
  }else{
    j <- 15 + p
    k <- ((i - 1) %% 3) + 1
    vd[i] <- stringr::str_c( stringr::str_c('20', j), vs[k])
    if(k == length(vs)){
      p <<- p + 1 
    }
  }
}
rm(i, j, k, p, n, vs)
names(gl_Data$l_Causeofdeath$df_Cod_SigunSexYear) <- vd
rm(vd)

#---------------------------------

##### NA 정제
nac <- sum(is.na(gl_Data$l_Causeofdeath$df_Cod_SigunSexYear[, 'Cause']) == TRUE)
v <- as.vector(as.matrix(gl_Data$l_Causeofdeath$df_Cod_SigunSexYear[is.na(gl_Data$l_Causeofdeath$df_Cod_SigunSexYear[, 'Cause']) == FALSE, 'Cause']))
n <- (nac / length(v)) + 1
for(i in 1:length(v)){
  y <- n * i
  x <- (y - n) + 1
  gl_Data$l_Causeofdeath$df_Cod_SigunSexYear[x : y, 'Cause'] <- v[i]
}
rm(i, v, x, y, nac)

v <- as.vector(as.matrix(gl_Data$l_Causeofdeath$df_Cod_SigunSexYear[1 : n, 'Sigun']))
v <- v[is.na(v) == FALSE]
for(i in 1:length(v)){
  for(j in 1:n){
    y <- (j * n) - n + (i * 3)
    x <- y - 1
    gl_Data$l_Causeofdeath$df_Cod_SigunSexYear[x : y, 'Sigun'] <- v[i]
  }
}
rm(i, j, n, v, x, y)








#---------------------------------

gl_Data$l_Causeofdeath <- NULL
view(gl_Data$l_Causeofdeath$df_Cod_SigunSexYear)
