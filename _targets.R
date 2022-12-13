# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
library(reticulate)
# library(tarchetypes) # Load other packages as needed. # nolint

# Set target options:
tar_option_set(
  packages = c("reticulate"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multicore")

# tar_make_future() configuration (okay to leave alone):
future::plan(future.callr::callr)

# Run the R scripts in the R/ folder with your custom functions:
lapply(list.files('R', full.names = T), source)
tar_source()
source('pySetup.R')

# source("other_functions.R") # Source other scripts as needed. # nolint

# Replace the target list below with your own:
list(
 tar_target(
    name = locList,
    command = 'ReservoirLocations.csv',
    format = "file" # efficient storage of large data frames # nolint
  ),
  tar_target(
    name = pyMakeFeature,
    command = 'b_loadlocs.py',
    format = 'file'
  ),
  tar_target(
    name = runPyMakeFeature,
    command = source_python(pyMakeFeature)
  ),
  tar_target(
   name = runPyMakeFeatureFunction,
   command = pySource(pyMakeFeature)
  ),
  tar_target(
    name = pyPlotLocs,
    command = 'c_plot.py',
    format = 'file'
  ),
  tar_target(
    name = runPyPlotLocs,
    command = source_python(pyPlotLocs) #note, tar_make will hang until you close the popup
  ),
  tar_target(
    name = runPyPlotLocsFunction,
    command = pySource(pyPlotLocs) #note, tar_make will hang until you close the popup
  )
)
