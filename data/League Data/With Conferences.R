library(tidyverse)

all_data = read.csv("C:/Users/Client/Downloads/All NBA Seasons League Data.csv")
conferences = read.csv("C:/Users/Client/Downloads/conferences.csv")


all_data = all_data %>% 
  left_join(conferences, by = c('Team' = 'Team'))


select(all_data, Team, Conference)


write.csv(all_data, "C:/Users/Client/OneDrive/UTSA MSDA/NBA DATA VIS PROJECT/NBA LEAGUE DATA/With Conf All NBA Seasons League Data.csv")



