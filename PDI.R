library(haven)
library(tidyverse)
library(stargazer)
library(ggplot2)

wdi_struc_change_assignment <- read_dta("wdi_struc_change_assignment.dta")
wdi_dtast <- wdi_struc_change_assignment

## Premature de-industrialisation

wdi_dtastPDI <- wdi_dtast %>% filter(year == c(1991,2001,2011)) %>%  mutate(log_gdp_pc_ppp=log(gdp_pc_ppp),
                                                                            Year= factor(year)) 

SC1 <- wdi_dtastPDI %>% ggplot(aes(x=log_gdp_pc_ppp, y= (ind_emp_sh)*10000, colour=Year))+
  geom_point(size=1)+
  geom_smooth(method = lm, formula = y ~ x + I(x^2), se=F)+
  xlab("GDP per capita (log;PPP terms)")+
  ylab(" Employment share, industry (%) ") +
  ggtitle("Relationship between employment share in industry and \nGDP per capita")

SC1
