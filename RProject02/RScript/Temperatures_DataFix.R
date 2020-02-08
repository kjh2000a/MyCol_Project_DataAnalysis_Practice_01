##############################
#
##############################

glist_Data[[length(glist_Data) + 1]] <- list()
names(glist_Data)[[length(glist_Data)]] <- 'list_Temper'

glist_Data$list_Temper[[length(glist_Data$list_Temper) + 1]] <- 
  readxl::read_excel(stringr::str_c(gstr_FixedPath, stringr::str_c('전국_기온_2010_2019', gv_Extension['xlsx'])), skip = 12)
names(glist_Data$list_Temper)[[length(glist_Data$list_Temper)]] <- 'df_Temper_All'

names(glist_Data$list_Temper$df_Temper_All) <-
  c('region_number', 'region_name', 'DateYYYYMM', 'TAver', 'TAverHigh',
    'THigh', 'THighName', 'TAverLow', 'TLow', 'TLowName')

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
