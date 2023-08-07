# this script is written to get layout details of the PLFS files #
# There are 4 files and the cell rage for the excel for each file is below #
# HHV1.txt A3:H40 #
# HHRV.txt A45:H77 #
# PerV1.txt A82:H225 #
# PerRV.txt A230:H334 #


# libraries and sources ---------------------------------------------------

library(here) # Manage directories
library(dplyr) # data Warangling

 # List all files to be sources with complete address
  
  paste(here("R"),list.files(here("R")),sep = "/") -> files_source
  
  # Load all listed source files
    
    purrr::map(files_source, source)


# Get Layout Details ------------------------------------------------------


  # Get Layout details for HHV1.txt, HHRV.txt, PerV1.txt and PerRV.txt
    
    
    list(
      pass_sheet = c(1,1,1,1,2),
      pass_range = c(
        "A3:H40",
        "A45:H77",
        "A82:H225",
        "A230:H334",
        "A2:B38"
      ),
      obj_name = c(
        "layout_hhv1",
        "layout_hhrv",
        "layout_perv1",
        "layout_perrv",
        "state_codes"
      )
    ) -> layout_details
    
    purrr::pmap(.l = layout_details,.f = get_layout_details)
    