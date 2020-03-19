devtools::load_all()
library(dplyr)

FANG %>% 
  dplyr::filter(symbol == "FB") %>% 
  ggplot(aes(x = date, y = close)) +
  geom_line() +
  labs(x = "date", y = "close", title = "Facebook stock close prices",
       subtitle = "More text") -> simple_line

simple_line + theme_mcg_pub() + scale_y_continuous(position = "right")
simple_line + theme_mpr() + scale_y_continuous(position = "right")
simple_line + theme_overground() + scale_y_continuous(position = "right")
