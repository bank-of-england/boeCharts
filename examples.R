devtools::load_all()
library(dplyr)
library(ggplot2)
library(gghighlight)
library(cowplot)

# single line charts
FANG %>% 
  dplyr::filter(symbol == "FB") %>% 
  ggplot(aes(x = date, y = close)) +
  geom_line() +
  labs(x = "date", y = "close", title = "Facebook stock close prices",
       subtitle = "More text") -> simple_line

simple_line + theme_mcg_pub() + 
  scale_y_continuous(position = "right") +
  scale_x_date(
    expand = c(0, 0), breaks = boe_breaks_date(), limits = boe_limits_date()
  )
simple_line + theme_mpr() + 
  scale_y_continuous(position = "right", sec.axis = dup_axis(labels = NULL)) +
  scale_x_date(
    expand = c(0, 0), breaks = boe_breaks_date(), limits = boe_limits_date()
    )
simple_line + theme_overground() + 
  scale_y_continuous(position = "right") +
  scale_x_date(
    expand = c(0, 0), breaks = boe_breaks_date(), limits = boe_limits_date()
  )

# multiple line charts
ggplot(FANG, aes(x = date, y = close, colour = symbol)) +
  geom_line() +
  labs(x = "date", y = "close", title = "Facebook stock close prices",
       subtitle = "More text") -> multiple_line

mpr_plot <- multiple_line + theme_mpr() + scale_y_continuous(position = "right")
over_plot <- multiple_line + theme_overground() + scale_y_continuous(position = "right")
mcg_plot <- multiple_line + theme_mcg_pub() + scale_y_continuous(position = "right")

# faceted line charts
mpr_plot + facet_wrap(~symbol)
mcg_plot + facet_wrap(~symbol)
over_plot + facet_wrap(~symbol)

# auto breaks/limits
multiple_line + theme_mpr() + 
  scale_y_continuous(position = "right", expand = c(0, 0),
                     breaks = boe_breaks_numeric(), limits = boe_limits_numeric())

# mpr axis titling
move_ylab(mpr_plot)
move_ylab(over_plot)
move_ylab(mcg_plot)

# HQ examples -------------------------------------------------------------

chart_nflx <- ggplot(data = FANG, aes(x = date, y = close, colour = symbol)) +
  # add lines
  geom_line(show.legend = FALSE) +
  # highlight netflix stocks
  gghighlight(
    symbol == "NFLX", 
    unhighlighted_params = list(colour = boe_neutral$stone),
    use_group_by = FALSE, use_direct_label = FALSE
  ) +
  # add some chart labels
  labs(
    title = "BoE Palette Test", 
    subtitle = "A plot for demonstration purposes",
    y = "Closing price", x = NULL
  ) +
  # use 'highlights' palette
  scale_colour_discrete_boe(palette = "boe_highlights") +
  # add Bank Overground theme
  theme_overground() +
  # apply custom axis settings
  scale_y_continuous(
    expand = c(0, 0), breaks = boe_breaks_numeric(), 
    limits = boe_limits_numeric(), position = "right"
  ) +
  scale_x_date(
    expand = c(0, 0), labels = boe_date_labels(),
    breaks = boe_breaks_date(), limits = boe_limits_date()
  )

# re-position y axis title above plot
chart_nflx_over <- move_ylab(chart_nflx) 

# create mpr version
chart_nflx_mpr <- chart_nflx +
  theme_mpr()

chart_nflx_mpr <- move_ylab(chart_nflx_mpr)

save_plot(
  "man/figures/overground-eg.png", chart_nflx_over,
  base_height = 5
  )
save_plot(
  "man/figures/mpr-eg.png", chart_nflx_mpr,
  base_height = 5
)
