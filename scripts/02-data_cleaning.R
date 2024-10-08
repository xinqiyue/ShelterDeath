#### Preamble ####
# Purpose: Cleans the raw marriage data into an analysis dataset
# Author: Xinqi Yue
# Date: 23 September 2024
# Contact: xinqi.yue@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Get data ####
raw_data <- read_csv("data/raw_data/shelter_residences_death_raw_data.csv")

#### Clean data ####
cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  tidyr::drop_na()


cleaned_data <- cleaned_data %>%
  mutate(
    transgender_non_binary_two_spirit =
      ifelse(transgender_non_binary_two_spirit == "n/a",
        NA,
        transgender_non_binary_two_spirit
      )
  )


#### Save data ####
write_csv(
  cleaned_data,
  "data/analysis_data/shelter_residences_death_analysis_data.csv"
)
