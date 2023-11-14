library(tidyverse)

d1 = read.csv("C:/Users/Client/OneDrive/UTSA MSDA/NBA DATA VIS PROJECT/nba_2022-23_all_stats.csv")

#Cleaning Team variable. Players that played on multiple teams in a season. Choosing team player ended
for(p in 1:539){  
  if (nchar(d1$Team[p]) >3){
    d1$Team[p] = str_sub(d1$Team[p], -3,-1)
  }
}

d2 = d1 %>% 
  #select(Player.Name, Team, WS) %>% 
  arrange(Team, -WS)


d2$Rank = 0
ctr = 1
q=2
for (p in 1:539){
  if(d2$Team[p] == d2$Team[q]){
    d2$Rank[p] = ctr
  }else{
    d2$Rank[p] = ctr
    ctr = 0
  } 
  ctr = 1+ctr
  q = 1+q
  }

d2$Rank[539] = 22

d3 = d2 %>% 
  filter(Rank>9)


write.csv(d3,"C:/Users/Client/OneDrive/UTSA MSDA/NBA DATA VIS PROJECT/player_pool.csv")


