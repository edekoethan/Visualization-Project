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