###############################################################################
# Project: Data Visualization Using ggplot2
# Author: Prime Study Group,EBDS, University of Oulu .
# Description:
#   This script demonstrates how to create high-quality data visualizations
#   using ggplot2 in R, including:
#     - Bar plots
#     - Histograms
#     - Boxplots
#     - Scatterplots
#     - Forest plots for odds ratios
#
# Datasets:
#   - example_dataset.txt
#   - results_catecholamine_chd.xlsx
#
# Output:
#   - Plots exported as PNG files
#
# Version: 1.0.0
###############################################################################

# ============================
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

# ============================
# 2. Load Dataset 1: Health Data
# ============================

d_health <- read.table(
  "example_dataset.txt",
  header = TRUE,
  sep = "\t"
)

head(d_health)   # quick preview


# ============================
# 3. BAR PLOTS
# ============================

# --- Basic barplot ---
barplot1 <- ggplot(d_health, aes(x = factor(smoking))) +
  geom_bar()

# --- Ordered barplot (Never → Former → Current) ---
barplot2 <- ggplot(d_health, aes(x = factor(smoking))) +
  geom_bar() +
  scale_x_discrete(limits = c("Never", "Former", "Current"))

# --- Add axis labels ---
barplot3 <- ggplot(d_health, aes(x = factor(smoking))) +
  geom_bar() +
  scale_x_discrete(
    limits = c("Never", "Former", "Current"),
    name = "Smoking Status"
  ) +
  scale_y_continuous(name = "Frequency")

# --- Convert y-axis to percentages ---
barplot4 <- ggplot(d_health, aes(x = factor(smoking))) +
  geom_bar(aes(y = after_stat(count / sum(count)))) +
  scale_x_discrete(
    limits = c("Never", "Former", "Current"),
    name = "Smoking Status"
  ) +
  scale_y_continuous(
    name = "Frequency (%)",
    labels = percent,
    limits = c(0, 0.55),
    expand = c(0, 0)
  )

# --- Add color + classic theme ---
barplot5 <- ggplot(d_health, aes(x = factor(smoking))) +
  geom_bar(aes(y = after_stat(count / sum(count))), fill = "blue") +
  scale_x_discrete(
    limits = c("Never", "Former", "Current"),
    name = "Smoking Status"
  ) +
  scale_y_continuous(
    name = "Frequency (%)",
    labels = percent,
    limits = c(0, 0.55),
    expand = c(0, 0)
  )

# --- Custom labels + theme ---
barplot6 <- barplot5 +
  scale_x_discrete(
    labels = c("Never smokers", "Former smokers", "Current smokers")
  )

barplot7 <- barplot6 + theme_classic()

# Save output
ggsave("barplot_smoking.png", barplot7)
ggsave("barplot_smoking_v2.png", barplot7, width = 10, height = 10, units = "cm")


# ============================
# 4. HISTOGRAMS
# ============================

# --- Basic histogram ---
hist1 <- ggplot(d_health, aes(x = BPsystolic)) +
  geom_histogram()

# --- Add fixed number of bins ---
hist2 <- ggplot(d_health, aes(x = BPsystolic)) +
  geom_histogram(bins = 12, fill = "white", color = "black")

# --- Axis labels + theme ---
hist3 <- hist2 +
  scale_x_continuous(name = "Systolic Blood Pressure") +
  scale_y_continuous(name = "Count")

hist4 <- hist3 + theme_classic()


# ============================
# 5. BOXPLOTS
# ============================

boxplot1 <- ggplot(d_health, aes(x = factor(sex), y = height)) +
  geom_boxplot()

boxplot2 <- ggplot(d_health, aes(x = factor(sex), y = height)) +
  geom_boxplot() +
  scale_x_discrete(name = "Sex", labels = c("Males", "Females")) +
  scale_y_continuous(name = "Height")


# ============================
# 6. SCATTERPLOTS
# ============================

# --- Basic scatterplot ---
scatterplot1 <- ggplot(d_health, aes(x = height, y = weight)) +
  geom_point()

# --- Add axis labels ---
scatterplot2 <- ggplot(d_health, aes(x = height, y = weight)) +
  geom_point() +
  scale_x_continuous(name = "Height") +
  scale_y_continuous(name = "Weight")

# --- Add color by sex ---
scatterplot3 <- ggplot(d_health, aes(x = height, y = weight, col = factor(sex))) +
  geom_point() +
  scale_x_continuous(name = "Height") +
  scale_y_continuous(name = "Weight") +
  scale_colour_manual(
    name = "Sex",
    values = c("blue", "gold"),
    labels = c("Males", "Females")
  )


# ============================
# 7. Load Dataset 2: Forest Plot Data
# ============================

d_results <- read_excel("results_catecholamine_chd.xlsx")


# ============================
# 8. FOREST PLOT
# ============================

# --- Basic OR plot ---
forest1 <- ggplot(d_results, aes(x = OR, y = factor(Model))) +
  geom_point()

# --- Add CI bars ---
forest2 <- forest1 +
  geom_errorbarh(aes(xmin = CI_lower, xmax = CI_upper), height = 0.2)

# --- Log scale + labeled axes ---
forest3 <- forest2 +
  scale_x_log10(name = "Odds Ratio", limits = c(0.8, 5)) +
  scale_y_discrete(name = "Model")

# --- Add red reference line at OR = 1 ---
forest4 <- forest3 +
  geom_vline(xintercept = 1, col = "red", linetype = "dashed")

# --- Final styled version ---
forest_final <- forest4 + theme_classic()

# --- Save forest plot ---
ggsave("forest_plot.png", forest_final, width = 12, height = 8, units = "cm")


###############################################################################
# End of Script
###############################################################################
