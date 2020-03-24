devtools::load_all()
library(dplyr)

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
