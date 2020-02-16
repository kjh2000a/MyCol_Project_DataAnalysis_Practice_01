##############################
# 연습 01 - 데이터를 제대로 정제해보기
##############################

#--------------------------------------------------

# Begin ######### 리스트화 관리 - 리스트로 관리할 경우만 사용
# 리스트 생성
l_Db[[length(l_Db) + 1]] <- list()
names(l_Db)[[length(l_Db)]] <- 'l_Cod'
# 리스트 삽입
l_Db$l_Cod[[length(l_Db$l_Cod) + 1]] <- df_CoD.Ori
names(l_Db$l_Cod)[[length(l_Db$l_Cod)]] <- 'df_CoD.Ori'
l_Db$l_Cod[[length(l_Db$l_Cod) + 1]] <- df_CoD.Fix
names(l_Db$l_Cod)[[length(l_Db$l_Cod)]] <- 'df_CoD.Fix'
# End ###########

#--------------------------------------------------

##### 정제

# 로드
df_CoD.Ori <- readxl::read_excel(path = './Data/PracData/사망원인.xlsx',
                                 na = c('-', 'X', NULL),
                                 skip = 1)

# 빈 데이터 정제 (NA 정제는 아니다) - 비어있는 범주에 데이터 추가
df_CoD.Fix <- 
  df_CoD.Ori %>% 
    tidyr::fill(c('사망원인별(50항목)', '시군구별'))

# 컬럼 이름 정제 1
names(df_CoD.Fix)[1:3] <- c('DType', 'SiDo', 'Sex')

n <- which(names(df_CoD.Fix) == 'Sex') + 1
v <- gsub('[...[:digit:]{2}]', '', names(df_CoD.Fix[n:ncol(df_CoD.Fix)]))

# 컬럼 이름 정제 2 - 년도 컬럼을 삭제 했기때문에 년도 추가
names(df_CoD.Fix)[n:ncol(df_CoD.Fix)] <-
  stringr::str_c( rep(2015 : 2018, each = length(unique(v))),
    stringr::str_c( '_', v))

# 데이터 형태 정제 
# 데이터를 롱 포맷으로 전환하고 년도와 구분을 분리하고 다시 와이드로 전환
df_CoD.Fix <- # 롱포맷 
  df_CoD.Fix %>%
    tidyr::gather(key = Year, value = Value, 4:ncol(df_CoD.Fix))
df_CoD.Fix <- # 날짜와 구분을 나눔
  df_CoD.Fix %>%
    tidyr::separate(col = Year, into = c('Year', 'Division'), sep = '\\_')
df_CoD.Fix <- # 구분을 와이드 포맷으로
  df_CoD.Fix %>%
    tidyr::spread(key = Division, value = Value)

n <- which(names(df_CoD.Fix) == 'Year') + 1

# 컬럼 이름 정제 3 - 위에서 미리 했으면 좋았을텐데 안해서 여기서 한번 더 함
names(df_CoD.Fix)[n:ncol(df_CoD.Fix)] <- c('DPer_10M', 'DCount', 'DPer_Age_10M')

# 컬럼 순서 정제
df_CoD.Fix <- df_CoD.Fix[c('Year', 'SiDo', 'DType', 'Sex', 'DCount', 'DPer_10M', 'DPer_Age_10M')]

# 정제 완료

#--------------------------------------------------

##### 분리
#이 데이터는 조사된 관측값에 대한 데이터가 아니라 집계로 된 데이터들이라 힘듬.
#그래서 집계 데이터라 분리가 불가능 / 아니 불가능은 아니지만 범주형 컬럼에서 하나만 기준으로 쪼갤 수 있음.



#--------------------------------------------------

#rm(n, v)
#rm(df_CoD.Ori, df_CoD.Fix)

#--------------------------------------------------