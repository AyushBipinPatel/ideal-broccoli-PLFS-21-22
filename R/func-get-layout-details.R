#' get_layout_details
#'
#' @description This function provides layout details of desired 
#' txt files  of the PLFS 2021-22 data
#' 
#' @param pass_sheet Name of the xlsx sheet or position. As 
#' expected by readxl::read_xlsx 
#' @param pass_range Range of the table in the layout of the xlsx
#' file as expected yb readxl::read_xlsx
#' @param obj_name Name for the layout data frame
#'
#' @return a layout dataframe
#' @export
#'
#' @examples


get_layout_details <- function(pass_sheet,pass_range,obj_name){
  
  readxl::read_xlsx(
    path = here("data-plfs-2021-2022/data layout/4Data_LayoutPLFS_2021-22.xlsx"),
    sheet = pass_sheet,
    range = pass_range
  )|>
    janitor::clean_names() -> temp
  
  return(assign(x = obj_name,value = temp,envir = .GlobalEnv))
  
}