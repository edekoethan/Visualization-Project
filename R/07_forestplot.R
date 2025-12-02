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