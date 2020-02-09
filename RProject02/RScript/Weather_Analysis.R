##############################
# 날씨 데이터 분석
##############################

#----------

cbind.data.frame(glist_Data$list_Temper$df_Temper_All %>%
                   filter(format(DateYYYYMM, '%m') == '07' | 
                            format(DateYYYYMM, '%m') == '08') %>%
                   group_by(region_number, region_name, DateYYYYMM = format(DateYYYYMM, '%Y')) %>%
                   summarise(TSummerAver = mean(TAver)) %>%
                   select(region_number, region_name, DateYYYYMM, TSummerAver)
                 , 
                 glist_Data$list_Temper$df_Temper_All %>%
                   filter(format(DateYYYYMM, '%m') == '01' | 
                            format(DateYYYYMM, '%m') == '02') %>%
                   group_by(DateYYYYMM = format(DateYYYYMM, '%Y')) %>%
                   summarise(TWinterAver = mean(TAver)) %>%
                   select(TWinterAver)
) %>%
  ggplot(aes(x = DateYYYYMM, y = TSummerAver)) + 
  geom_point()

view(glist_Data$list_Temper$df_Temper_All)
rm(df1, df2, df3)

#----------
