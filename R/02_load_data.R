# ============================
# 2. Load Dataset 1: Health Data
# ============================

d_health <- read.table(
  "example_dataset.txt",
  header = TRUE,
  sep = "\t"
)

head(d_health)   # quick preview