# loading required packages
library(tidyverse)
library(here)
library(ggpubr)
library(spmodel)

# saved figure sizes
width <- 789 * 2
height <- 789 * 2
units_val <- "px"
dpi_val <- 300
comp_val <- "zip"

# figure 1
fig1 <- ggplot(moss, aes(color = log_Zn)) +
  geom_sf(size = 2) +
  scale_color_viridis_c() +
  theme_gray(base_size = 14)
fig1
ggsave(
  here("inst", "preprint", "figures", "fig1.tiff"),
  fig1,
  width = width,
  height = height,
  units = units_val,
  dpi = dpi_val,
  compression = comp_val
)

# figure 2
spmod <- splm(log_Zn ~ log_dist2road, moss, spcov_type = "exponential")
tiff(
  here("inst", "preprint", "figures", "fig2.tiff"),
  width = width,
  height = height * 3/4,
  res = dpi_val,
  compression = comp_val
)
plot(spmod, which = 7)
dev.off()

# figure 3
fig3 <- ggplot(seal, aes(fill = log_trend)) +
  geom_sf(size = 0.75) +
  scale_fill_viridis_c() +
  theme_bw(base_size = 14)
fig3
ggsave(
  here("inst", "preprint", "figures", "fig3.tiff"),
  fig3,
  width = width,
  height = height,
  units = units_val,
  dpi = dpi_val,
  compression = comp_val
)

# figure 4
fig4a <- ggplot(sulfate, aes(color = sulfate)) +
  geom_sf(size = 1.25) +
  scale_color_viridis_c(limits = c(0, 45)) +
  theme_gray(base_size = 18)
sulfmod <- splm(sulfate ~ 1, sulfate, spcov_type = "spherical")
sulfate_preds$preds <- predict(sulfmod, newdata = sulfate_preds)
fig4b <- ggplot(sulfate_preds, aes(color = preds)) +
  geom_sf(size = 1.25) +
  scale_color_viridis_c(limits = c(0, 45)) +
  theme_gray(base_size = 18) +
  labs(color = "preds  ")
fig4 <- ggarrange(fig4a, fig4b, ncol = 1)
fig4
ggsave(
  here("inst", "preprint", "figures", "fig4.tiff"),
  fig4,
  width = width,
  height = height,
  units = units_val,
  dpi = dpi_val,
  compression = comp_val
)

# figure 5
# PRELIMINARIES
r <- 1
theta_seq <- seq(0, 2 * pi, length.out = 1000)
x_orig <- r * cos(theta_seq)
y_orig <- r * sin(theta_seq)
df_orig <- data.frame(x = x_orig, y = y_orig)

# 5a
fig5a <- ggplot(df_orig, aes(x = x, y = y)) +
  geom_point() +
  scale_x_continuous(limits = c(-1, 1), breaks = c(0)) +
  scale_y_continuous(limits = c(-1, 1), breaks = c(0)) +
  labs(x = "x-distance", y = "y-distance") +
  theme(axis.text = element_text(size = 18),
        axis.title = element_text(size = 18)) +
  coord_fixed() # theme_gray() causes polygon edge not found bug

# 5b
theta <- pi / 4 # (30 degrees)
R <- 1 / 3
scale <- matrix(c(1, 0, 0, R), nrow = 2, byrow = TRUE)
rotate <- matrix(c(cos(theta), -sin(theta), sin(theta), cos(theta)), nrow = 2, byrow = TRUE)
transform <- rotate %*% scale
coords <- transform %*% rbind(df_orig[["x"]], df_orig[["y"]])
df <- data.frame(x = coords[1, ], y = coords[2, ])
fig5b <- ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  scale_x_continuous(limits = c(-1, 1), breaks = c(0)) +
  scale_y_continuous(limits = c(-1, 1), breaks = c(0)) +
  labs(x = "x-distance", y = "y-distance") +
  theme(axis.text = element_text(size = 18),
        axis.title = element_text(size = 18)) +
  coord_fixed()

fig5 <- ggarrange(fig5a, fig5b, nrow = 1)
fig5
ggsave(
  here("inst", "preprint", "figures", "fig5.tiff"),
  fig5,
  width = width,
  height = height,
  units = units_val,
  dpi = dpi_val,
  compression = comp_val
)

# figure 6
sim_params <- spcov_params("exponential", de = 5, ie = 1, range = 0.5)
set.seed(0)
n <- 3000
x <- runif(n)
y <- runif(n)
coords <- tibble::tibble(x, y)
resp <- sprnorm(
  sim_params,
  data = coords,
  xcoord = x,
  ycoord = y
)
sim_data <- tibble::tibble(coords, resp)

local1 <- splm(
  resp ~ 1,
  sim_data,
  spcov_type = "exponential",
  xcoord = x,
  ycoord = y,
  local = TRUE
)

n_pred <- 1000
x <- runif(n_pred)
y <- runif(n_pred)
sim_preds <- tibble::tibble(x = x, y = y)

sim_preds$preds <- predict(local1, newdata = sim_preds, local = TRUE)

fig6a <- ggplot(sim_data, aes(x = x, y = y, color = resp)) +
  geom_point(size = 0.5) +
  scale_color_viridis_c(limits = c(-7, 7)) +
  theme_gray(base_size = 18) +
  labs(color = "resp ")

fig6b <- ggplot(sim_preds, aes(x = x, y = y, color = preds)) +
  geom_point(size = 0.5) +
  scale_color_viridis_c(limits = c(-7, 7)) +
  theme_gray(base_size = 18)

fig6 <- ggarrange(fig6a, fig6b, ncol = 1)
fig6

ggsave(
  here("inst", "preprint", "figures", "fig6.tiff"),
  fig6,
  width = width,
  height = height,
  units = units_val,
  dpi = dpi_val,
  compression = comp_val
)

# print session information
sessionInfo()
