#연습

library(sf)
library(tmap)
library(rmapshaper)

df_Data <- read.csv(file = './Data/TempData/newlyweds_locations.csv', skip = 1)
df_koreaShp <- sf::st_read('./Data/TempData/Z_SOP_BND_SIDO_PG.shp', options = 'ENCODING=EUC-KR') #UTF-8") #, stringsAsFactors = FALSE)
df_koreaShpSimple <- rmapshaper::ms_simplify(df_koreaShp, keep = 0.05)
#df_koreaShpSimple$BASE_YEAR <- factor(df_koreaShpSimple$BASE_YEAR)
#df_koreaShpSimple$SIDO_CD <- factor(df_koreaShpSimple$SIDO_CD)
#df_koreaShpSimple$SIDO_NM <- Encoding('UTF-8')

df_DataFix <- df_Data %>%
                select(-starts_with('X'))
names(df_DataFix)[1] <- 'Region'

for(i in 2:length(df_DataFix)){
  names(df_DataFix)[i] <- stringr::str_c( 2015 + (i - 2), '_Pop')  
}
df_DataFix <- df_DataFix %>%
                filter(Region != '전국')
df_DataFix$Region <- factor(df_DataFix$Region)

df_DataFix <- cbind(Region_code = df_koreaShpSimple$SIDO_CD, df_DataFix)
df_koreaShpSimpleFix <- df_koreaShpSimple %>%
                          left_join(df_DataFix, by = c('SIDO_CD' = 'Region_code'))
df_koreaShpSimpleFix[, 'SIDO_NM'] <- NULL
names(df_koreaShpSimpleFix)[3] <- 'SIDO_NM'

KoreaMap <- tm_shape(df_koreaShpSimpleFix, projection = 'rd') +
            tm_fill(col = '2015_Pop') +
            tm_borders()
            # tm_polygons(col = '2015_Pop') +
            # tm_fill(col = '2015_Pop', title = 'population') +
            # tm_layout(legend.bg.color = "white", legend.bg.alpha=.5, legend.frame=TRUE) +
            # tm_borders()

map <- leaflet() %>%
        addTiles() %>%  # use the default base map which is OpenStreetMap tiles
        addMarkers(lng = 174.768, lat = -36.852, popup = "The birthplace of R")
map

tmap_mode("plot")
tmap_mode('view')


tmap_leaflet(KoreaMap)

leaflet(width = "100%", height = "800px") %>%
  addTiles(group = "OpenStreeMap.Default")
  addPolygons(data = KoreaMap)


KoreaMap
KoreaMaplf <- tmap_leaflet(KoreaMap)

leaflet(KoreaMap)





plot(df_koreaShp)
  

df_Data[-1, ]

qtmKorea <- tmap::qtm(shp = korea, fill = df$합계)
qtmKorea

tmap::tmap_mode('view')
KoreaMap <- tm_shape(shp = df_koreaShp) +
            tm_polygons(c(df_Data$행정구역별, df_Data$합계))
            #tm_layout(legend.bg.color = "grey90", legend.bg.alpha=.5, legend.frame=TRUE)

KoreaMap


rm(current.mode)
view(df)
