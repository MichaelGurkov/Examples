library(jsonlite)

library(tidyverse)

df = read_json(paste0("C:\\Users\\Misha\\Documents\\Data",
                      "\\data.world\\ScothWhiskey.json"),simplifyVector = TRUE)


ratings = lapply(seq_along(df$data$name),function(temp_ind){
  temp_df = df$data$average_ratings[[temp_ind]]
  
  temp_df$region = df$data$name[temp_ind]
  
  return(temp_df)
  
  }) %>% 
  bind_rows()

distilleries = lapply(seq_along(df$data$name),function(temp_ind){
  temp_df = data.frame(distillery = df$data$distilleries[[temp_ind]])
  
  temp_df$region = df$data$name[temp_ind]
  
  return(temp_df)
  
}) %>% 
  bind_rows()
  

