devtools::load_all()
library(dplyr)

# single line charts
FANG %>% 
  dplyr::filter(symbol == "FB") %>% 
  ggplot(aes(x = date, y = close)) +
  geom_line() +
  labs(x = "date", y = "close", title = "Facebook stock close prices",
       subtitle = "More text") -> simple_line

simple_line + theme_mcg_pub() + scale_y_continuous(position = "right")
simple_line + theme_mpr() + scale_y_continuous(position = "right")
simple_line + theme_overground() + scale_y_continuous(position = "right")

# multiple line charts
ggplot(FANG, aes(x = date, y = close, colour = symbol)) +
  geom_line() +
  labs(x = "date", y = "close", title = "Facebook stock close prices",
       subtitle = "More text") -> multiple_line

multiple_line + theme_mcg_pub() + scale_y_continuous(position = "right")
multiple_line + theme_mpr() + scale_y_continuous(position = "right")
multiple_line + theme_overground() + scale_y_continuous(position = "right")

# faceted line charts
multiple_line + theme_mcg_pub() + scale_y_continuous(position = "right") +
  facet_wrap(~symbol)
multiple_line + theme_mpr() + scale_y_continuous(position = "right") +
  facet_wrap(~symbol)
multiple_line + theme_overground() + scale_y_continuous(position = "right") +
  facet_wrap(~symbol)
