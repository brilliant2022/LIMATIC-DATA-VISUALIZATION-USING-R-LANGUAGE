library(readr)
ghg_p_02 <- read_csv("C:/Users/USER/Downloads/ghg_p_02.csv")
View(ghg_p_02)

library(ggplot2)

library(viridis)

ggplot()+
  geom_line(data=ghg_p_02, aes(x=year, y=total_ghg_emission),linetype="solid", size=1)+
  ggtitle("台灣1990-2021年溫室氣體排放量") +
  xlab("年") + ylab("總溫室氣體排放量")+
  theme(plot.title = element_text(hjust = 0.5))


library(readr)
ghg_p_01 <- read_csv("C:/Users/USER/Downloads/ghg_p_01.csv")
View(ghg_p_01)

ggplot(data=ghg_p_01, aes(x=text, y= ghg_p_01 $tot/1000000))+
  geom_boxplot() +
  ggtitle("109至111年應盤查公司之地區 CO2 排放量") +
  scale_y_continuous(breaks = seq(0, 30, by=5), limits = c(0,30)) +
  xlab("\nRegion")+
  ylab("CO2 emission(百萬)")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  theme(plot.title = element_text(hjust = 0.5))


colorpad <- c("#4CAF50", "#9C27B0", "#3F51B5", "#2196F3", 
              "#00BCD4", "#CDDC39", "#FFEB3B", "#FF9800")
text<- gsub("台","臺",ghg_p_01$city)
ggplot(data=ghg_p_01, aes(fill=as.character(ghg_p_01$app_year), x= text,y=ghg_p_01$tot/1000000))+
  geom_bar(stat="identity",position="dodge",width=0.7)+
  ggtitle("各地區應盤查公司之CO2排放量(109-111)")+
  xlab("\nRegion")+
  ylab("CO2 emission(百萬)")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_fill_manual(values = colorpad,name="year")

#no
ggplot(data=ghg_p_01, aes( x= as.character(ghg_p_01$app_year),y=ghg_p_01$tot/1000000))+
  geom_bar(stat="identity",position="dodge",width=0.7)+
  ggtitle("各地區應盤查公司之CO2排放量(109-111)")+
  xlab("\nRegion")+
  ylab("CO2 emission(百萬)")+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_fill_manual(values = colorpad,name="year")

#no
Taiwan_111 <- ghg_p_01[ghg_p_01$app_year=="111",]
Taiwan_110 <- ghg_p_01[ghg_p_01$app_year=="110",]
Taiwan_109 <- ghg_p_01[ghg_p_01$app_year=="109",]
ggplot()+
  geom_line(data=ghg_p_01[ghg_p_01$app_year=="111",], aes(x=city, y=tot),linetype="solid",color="red", size=0.5)+
  geom_line(data=ghg_p_01[ghg_p_01$app_year=="110",], aes(x=city, y=tot),linetype="solid",color="blue", size=0.5)+
  geom_line(data=ghg_p_01[ghg_p_01$app_year=="109",], aes(x=city, y=tot),linetype="solid",color="yellow", size=0.5)+
  ggtitle("Total CO2 emission by Taiwan\n (EIA data)") +
  xlab("Year") + ylab("CO2 Emssion (MMt)")

library(readr)
X23 <- read_csv("C:/Users/USER/Downloads/23.csv")
View(X23)

ggplot(data=X23, aes(x=reorder(county,-SUM_of_count), y=SUM_of_count)) +
  geom_bar(stat = "identity")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  theme(plot.title = element_text(hjust = 0.5))+
  ggtitle("2011-2024/08/15各地區熱傷害人數")+
  xlab("\n城市") + ylab("人數")

ggplot(data=X23, aes(x=year, y=SUM_of_count)) +
  geom_bar(stat = "identity")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  theme(plot.title = element_text(hjust = 0.5))+
  ggtitle("2011-2024/08/15台灣熱傷害人數")+
  xlab("年") + ylab("人數")

ta <- X23[X23$county=="台中市",]
ggplot(data=X23[X23$county=="台中市",], aes(x=year, y=SUM_of_count)) +
  geom_bar(stat = "identity")+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+
  theme(plot.title = element_text(hjust = 0.5))+
  ggtitle("2011-2024/08/15台中市熱傷害人數")+
  xlab("年分") + ylab("人數")


library(readr)
you <- read_csv("C:/Users/USER/Downloads/經濟部能源署_能源指標年資料.csv")
View(you)

yo <- you[you$`日期(年)`< 2023,]
ggplot()+
  geom_line(data=yo, aes(x=yo$`日期(年)`, y=yo$`平均每人二氧化碳排放量(公噸CO2/人)`))+
  ggtitle("2003-2022年平均每人二氧化碳排放量")+
  xlab("年") + ylab("平均每人二氧化碳排放量(公噸CO2/人)")+
  theme(plot.title = element_text(hjust = 0.5))

ggplot()+
  geom_line(data=yo, aes(x=yo$`日期(年)`, y=yo$`平均每人用電量(度/人)`))+
  ggtitle("2003-2022年平均每人用電量")+
  xlab("年") + ylab("平均每人用電量(度/人)")+
  theme(plot.title = element_text(hjust = 0.5))

            