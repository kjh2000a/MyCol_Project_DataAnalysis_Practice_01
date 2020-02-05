##############################
#
##############################

##### Employee 데이터 정제

#Employee 리스트 최초 생성
glist_DataBase[[length(glist_DataBase) + 1]] <- list()
names(glist_DataBase)[[length(glist_DataBase)]] <- 'list_Employed'

glist_DataBase$list_Employed[[length(glist_DataBase$list_Employed) + 1]] <- 
  read_xlsx(path = stringr::str_c( gstr_FixedPath, str_c('Employed+Sido+Age+Year', gv_Extension['xlsx'])))
names(glist_DataBase$list_Employed)[length(glist_DataBase$list_Employed)] <- 'df_Sido_Age_Year'

#이름 정제
names(glist_DataBase$list_Employed$df_Sido_Age_Year)[1:2] <- 
  c('sido', 'age')
names(glist_DataBase$list_Employed$df_Sido_Age_Year)[3:ncol(glist_DataBase$list_Employed$df_Sido_Age_Year)] <- 
  stringr::str_replace(names(glist_DataBase$list_Employed$df_Sido_Age_Year)[3:ncol(glist_DataBase$list_Employed$df_Sido_Age_Year)],
                       ' ', '_')

#타입 정제
glist_DataBase$list_Employed$df_Sido_Age_Year <- 
  cbind(glist_DataBase$list_Employed$df_Sido_Age_Year[, 1:2],
        glist_DataBase$list_Employed$df_Sido_Age_Year[, 3:ncol(glist_DataBase$list_Employed$df_Sido_Age_Year)] %>% 
          lapply(as.numeric))

#NA 정제
vtemp <- as.vector(as.matrix(glist_DataBase$list_Employed$df_Sido_Age_Year[1]))
vName <- vtemp[is.na(vtemp) == FALSE]
for(i in 1:length(vName)){
  y = i * 10
  x = y - 10 + 1
  glist_DataBase$list_Employed$df_Sido_Age_Year[x : y, 1] <- 
    stringr::str_replace_na(glist_DataBase$list_Employed$df_Sido_Age_Year[x : y, 1], vName[i])  
}#루프를 안돌려도 다른 방법이 있을거 같은데... 그래도 어차피 루프가 18번 밖에 안돌기 떄문에 문제는 없음.
rm(vtemp, vName, x, y, i)

#남은 NA 확인
sum(is.na(glist_DataBase$list_Employed$df_Sido_Age_Year)) # 아직도 100개가 남았는데 이건 여기서 정제 하지 말자.



##### 확인 및 정리 용

#삭제 - 이건 메인 데이터 리스트에 문제 생기면 해당 원소 삭제용으로 코드 박아둠
glist_DataBase$list_Employed[['df_Sido_Age_Year']] <- NULL
#뷰 - 확인용
view(glist_DataBase$list_Employed$df_Sido_Age_Year)
