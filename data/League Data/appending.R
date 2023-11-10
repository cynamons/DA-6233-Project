library(tidyverse)
path = "C:/Users/Client/OneDrive/UTSA MSDA/NBA DATA VIS PROJECT/NBA LEAGUE DATA/"
ext = ".csv"

file_list = data.frame(name = c('2022_2023_league_summary',
                                 '2021_2022_league_summary',
                                 '2020_2021_league_summary',
                                 '2019_2020_league_summary',
                                 '2018_2019_league_summary',
                                 '2017_2018_league_summary',
                                 '2016_2017_league_summary',
                                 '2015_2016_league_summary',
                                 '2014_2015_league_summary',
                                 '2013_2014_league_summary'))



for (p in 1:10){
  file_list$full[p] = paste0(path,file_list$name[p],ext)
}

alldat = list()

for (p in 1:10){
  alldat[[p]] = read.csv(file_list$full[p])
}

fulldata = bind_rows(alldat, .id = "season")

fulldata$season[1:31] = "2022-2023"
fulldata$season[32:62] = "2021-2022"
fulldata$season[63:93] = "2020-2021"
fulldata$season[94:124] = "2019-2020"
fulldata$season[125:155] = "2018-2019"
fulldata$season[156:186] = "2017-2018"
fulldata$season[187:217] = "2016-2017"
fulldata$season[218:248] = "2015-2016"
fulldata$season[249:279] = "2014-2015"
fulldata$season[280:310] = "2013-2014"


fulldata$year= str_sub(fulldata$season,-4,-1)
fulldata= fulldata %>% select(season, year, everything())

write.csv(fulldata, "C:/Users/Client/OneDrive/UTSA MSDA/NBA DATA VIS PROJECT/NBA LEAGUE DATA/All NBA Seasons League Data.csv")



