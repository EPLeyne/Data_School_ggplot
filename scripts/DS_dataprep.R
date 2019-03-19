library(tidyverse)

col_drop <- c('fpNodeId', 'packet_stemid', 'position', 'pot_stemid', 'Photo_20181129.60.1', 'Photo_20181204.32.1', 'Flowering Date_20180524.40.1')

DS_polytunnel_vis <- read_csv('DS_polytunnel-wide.csv') %>% 
  select(-(col_drop)) %>% 
  dplyr::rename_all(funs(make.names(.))) # %>% 
#  filter(line.id < 25)

# DS_polytunnel_vis %>% 
#   mutate(flowering_date = Flowering.Date_20180725.15.1,Flowering.Date_20180817.2.1,
#          final_leaf_number = final.leaf.number_20180524.41.1, final.leaf.number_20181204.26.1, final.leaf.number_20181210.31.1)# %>% 
#   # mutate(final_leaf_number = final.leaf.number_20180524.41.1, final.leaf.number_20181204.26.1, final.leaf.number_20181210.31.1) %>% 
#   # mutate(spikelet_number = spikelet.number_20180524.42.1, spikelet.number_20181204.27.1, spikelet.number_20181210.32.1) %>% 
#   # mutate(height_mm = Height_20180524.43.1, Height_20181204.28.1, Height_20181210.33.1) %>% 
#   # mutate(tiller_count = tillers_20180524.44.1, tillers_20181204.29.1, tillers_20181210.34.1) %>% 
#   # mutate(spike_length = Spike.Length_20181122.59.1, Spike.Length_20181204.31.1, Spike.Length_20181210.36.1)


DS_polytunnel_vis <- mutate(DS_polytunnel_vis, flowering_date = Flowering.Date_20180725.15.1,Flowering.Date_20180817.2.1) %>% 
  select(-c(Flowering.Date_20180725.15.1, Flowering.Date_20180817.2.1))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, final_leaf_number = final.leaf.number_20180524.41.1, final.leaf.number_20181204.26.1, final.leaf.number_20181210.31.1) %>% 
  select(-c(final.leaf.number_20180524.41.1, final.leaf.number_20181204.26.1, final.leaf.number_20181210.31.1))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, spikelet_number = spikelet.number_20180524.42.1, spikelet.number_20181204.27.1, spikelet.number_20181210.32.1) %>% 
  select(-c(spikelet.number_20180524.42.1, spikelet.number_20181204.27.1, spikelet.number_20181210.32.1))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, height_mm = Height_20180524.43.1, Height_20181204.28.1, Height_20181210.33.1) %>% 
  select(-c(Height_20180524.43.1, Height_20181204.28.1, Height_20181210.33.1))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, tiller_count = tillers_20180524.44.1, tillers_20181204.29.1, tillers_20181210.34.1) %>% 
  select(-c(tillers_20180524.44.1, tillers_20181204.29.1, tillers_20181210.34.1))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, spike_length = Spike.Length_20181122.59.1, Spike.Length_20181204.31.1, Spike.Length_20181210.36.1) %>% 
  select(-c(Spike.Length_20181122.59.1, Spike.Length_20181204.31.1, Spike.Length_20181210.36.1))


col_select <- c('Row', 'Column', 'line.id', 'line.name', 'seed.weight_20190208.65.1', 'plant_date_20190318.1.1', 'vern_end_date_20190318.1.1', 'flowering_date', 
                              'final_leaf_number', 'spikelet_number', 'height_mm', 'tiller_count', 'spike_length')
DS_polytunnel_vis <- select(DS_polytunnel_vis, col_select)

DS_polytunnel_vis <- na.omit(DS_polytunnel_vis)

DS_polytunnel_vis <- filter(DS_polytunnel_vis, line.id < 45)

write_csv(DS_polytunnel_vis, 'raw_data/DS_polytunnel_CAS.csv')
