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

