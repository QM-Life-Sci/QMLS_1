library(tidyverse)
library(performance)

set.seed(34747322)

b <- 5

dd <- tibble(x = runif(n = 100, min = -10, max = 10),
             y = b * x + rnorm(n = 100, mean = 10, sd = 3))
dd <- rbind(dd, c(-7, 15))

ggplot(dd, aes(x, y)) +
  geom_point() +
  geom_smooth(formula = y ~ x, method = "lm", se = FALSE)

fm <- lm(y ~x, dd)
check_model(fm)
