# 1. Load Required Packages
# ============================

required_packages <- c("ggplot2", "dplyr", "tidyr", "scales", "readxl")

# Install missing packages automatically
installed <- rownames(installed.packages())
to_install <- setdiff(required_packages, installed)

if (length(to_install) > 0) {
  install.packages(to_install)
}

# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)
library(readxl)