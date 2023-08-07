# Use the Layout details and save the 4 PLFS files as csv


# libraries and sources ---------------------------------------------------

library(here) # Manage directories
library(dplyr) # data Wrangling

# List all files to be sources with complete address

paste(here("R"),list.files(here("R")),sep = "/") -> files_source

# Load all listed source files

purrr::map(files_source, source)


# Extract HHV1 ---------------------------------------------------

readr::read_fwf(file = here("data-plfs-2021-2022/raw data/HHV1.TXT"),
                col_positions = readr::fwf_widths(widths = layout_hhv1$field_length,
                                                  col_names = janitor::make_clean_names(
                                                    layout_hhv1$full_name
                                                  )))-> hhv1


# Extract HHRV ------------------------------------------------------------

readr::read_fwf(file = here("data-plfs-2021-2022/raw data/HHRV.TXT"),
                col_positions = readr::fwf_widths(widths = layout_hhrv$field_length,
                                                  col_names = janitor::make_clean_names(
                                                    layout_hhrv$full_name
                                                  )))-> hhrv


# Extract PerV1 -----------------------------------------------------------

readr::read_fwf(file = here("data-plfs-2021-2022/raw data/PERV1.txt"),
                col_positions = readr::fwf_widths(widths = layout_perv1$field_length,
                                                  col_names = janitor::make_clean_names(
                                                    layout_perv1$full_name
                                                  ))) -> perv1


# Extract PerRV -----------------------------------------------------------

readr::read_fwf(file = here("data-plfs-2021-2022/raw data/PERRV.txt"),
                col_positions = readr::fwf_widths(widths = layout_perrv$field_length,
                                                  col_names = janitor::make_clean_names(
                                                    layout_perrv$full_name
                                                  )))-> perrv



# Save these data sets ----------------------------------------------------


hhv1|>
  saveRDS(here("extracted-data/hhv1.RDs"))

hhrv|>
  saveRDS(here("extracted-data/hhrv.RDs"))

perv1|>
  saveRDS(here("extracted-data/perv1.RDs"))

perrv|>
  saveRDS(here("extracted-data/perrv.RDs"))
