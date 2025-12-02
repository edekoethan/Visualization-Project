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

