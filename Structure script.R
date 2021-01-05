
devtools::install_github('CelloHealthInsight/CelloLoad')


credentials::set_github_pat()

install.packages('dplyr')
install.packages('magrittr')
library(magrittr)
library(dplyr)

#saving data into path. Replacing all backslash with two backslashes (can be done with CTRL+F, "In Selection", replace all single backslash with double backslash)

e_path <- "\\\\chidns-mediauk\\insight media (charterhouse)$\\Research\\2020\\200239\\Quant\\Data\\2. Raw data\\2. Interim data\\139151_AutoExport_SPSS_All_Status.sav"

#Load using
#CelloLead, producing a list with the data, variables, and value labels as seperate tables
e_list <- CelloLoad::load_cello(file = e_path)


e_list %>% str(1)

e_list[[1]] %>%
  dplyr::as_tibble()
e_list$data %>%
  dplyr::as_tibble()

# Extract data from d_list and transform to tibble

patient_data <- e_list$data %>% dplyr::as_tibble()
patient_data %>% dplyr::glimpse()

e_list[[2]] %>%
  dplyr::as_tibble()
e_list[[2]] %>% dplyr::glimpse()
e_list[[2]] %>% View

# Extract variable labels table
patient_varlabs <- e_list[[2]] %>% dplyr::as_tibble()

patient_varlabs %>% dplyr::glimpse()
patient_varlabs %>% view

#extract value labels table
e_list[[3]] %>% dplyr::as_tibble()

patient_vallabs <- e_list[[3]] %>%
  dplyr::as_tibble()

patient_vallabs %>% dplyr::glimpse()
patient_vallabs %>% str()
patient_vallabs %>% View

# Confirm columns included in data
patient_data %>% colnames

# Checking columns columns included in question  of the survey?

patient_data %>%
  dplyr::select(tidyselect::starts_with('qa4jb')) %>%
  colnames

# Store Q1 variables in vector

qa4jb_mask <- patient_data %>%
  dplyr::select(tidyselect::starts_with('qa4jb')) %>%
  colnames()

# Access value and variable labels for these columns to confirm metadata

patient_varlabs %>%
  dplyr::filter(variable %in% qa4jb_mask)

patient_vallabs %>%
  dplyr::filter(variable %in% qa4jb_mask)

# Running summary on qa4jb to confirm: missing values, variability (i.e. constant values), scale values
patient_data %>%
  dplyr::filter(status == 'complete') %>%
  dplyr::select(tidyselect::starts_with('qa4jb')) %>%
  summary

# Storing Qa1 variables in vector qa1_mask, access value and variable labels to confirm, and then running summary
qa1_mask <- patient_data %>%
  dplyr::select(tidyselect::starts_with('qa1_')) %>% colnames

patient_varlabs %>%
  dplyr::filter(variable %in% qa1_mask) %>%
  dplyr::pull(label)

patient_vallabs %>%
  dplyr::filter(variable %in% qa1_mask)

patient_data %>%
  dplyr::filter(status == 'complete') %>%
  dplyr::select(tidyselect::starts_with('qa1_')) %>%
  summary

# Storing Qa2j variables in vector qa2j_mask, access value and variable labels to confirm, and then running summary
qa2jmask <- patient_data %>%
  dplyr::select(tidyselect::starts_with('qa2j')) %>%
  colnames()

patient_varlabs %>%
  dplyr::filter(variable %in% qa2jmask) %>%
  dplyr::pull(label)

patient_vallabs %>%
  dplyr::filter(variable %in% qa2jmask)

patient_data %>%
  dplyr::filter(status == 'complete') %>%
  dplyr::select(tidyselect::starts_with('qa2j')) %>%
  summary

# Storing Qa5j variables in vector qa5j_mask, access value and variable labels to confirm, and then running summary
qa5jmask <- patient_data %>%
  dplyr::select(tidyselect::starts_with('qa5j')) %>% colnames()

patient_varlabs %>%
  dplyr::filter(variable %in% qa5jmask) %>%
  dplyr::pull(label)

patient_vallabs %>%
  dplyr::filter(variable %in% qa5jmask)

patient_data %>%
  dplyr::filter(status == 'complete') %>%
  dplyr::select(tidyselect::starts_with('qa5j')) %>%
  summary

# Storing Qa6j variables in vector qa6j_mask, access value and variable labels to confirm, and then running summary
qa6jmask <- patient_data %>%
  dplyr::select(tidyselect::starts_with('qa6j')) %>%
  colnames

patient_varlabs %>%
  dplyr::filter(variable %in% qa6jmask) %>%
  dplyr::pull(label)

patient_vallabs %>%
  dplyr::filter(variable %in% qa6jmask)

patient_data %>%
  dplyr::filter(status == 'complete') %>%
  dplyr::select(tidyselect::starts_with('qa6j')) %>%
  summary

# Storing Qf6 variables in vector qf6_mask, access value and variable labels to confirm, and then running summary

qf6mask <- patient_data %>%
  dplyr::select(tidyselect::starts_with('qf6')) %>%
  colnames

patient_varlabs %>%
  dplyr::filter(variable %in% qf6mask) %>%
  dplyr::pull(label)

patient_vallabs %>%
  dplyr::filter(variable %in% qf6mask)

patient_data %>%
  dplyr::filter(status == 'complete') %>%
  dplyr::select(tidyselect::starts_with('qf6')) %>%
  summary


