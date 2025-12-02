# ============================
# 5. BOXPLOTS
# ============================

boxplot1 <- ggplot(d_health, aes(x = factor(sex), y = height)) +
  geom_boxplot()

boxplot2 <- ggplot(d_health, aes(x = factor(sex), y = height)) +
  geom_boxplot() +
  scale_x_discrete(name = "Sex", labels = c("Males", "Females")) +
  scale_y_continuous(name = "Height")
