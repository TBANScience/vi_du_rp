library(tidyverse)
install.packages("devtools")
devtools::install_github("ttimbers/canlang")
library(canlang)
head(can_lang)

ggplot2::ggplot(data = can_lang,
                aes(x = most_at_home, y = mother_tongue,
                    colour = category, shape = category)) +
  geom_point(alpha = 0.7) +
  scale_color_manual(values = c("blue3","red3","black")) +
  scale_y_log10(name = "Number of Canadians reporting the \n language as their mother tongue",
                labels = scales::comma) +
  scale_x_log10(name = "Number of Canadians speaking the language \n as their primary language at home",
                labels = scales::comma) +
  annotation_logticks() +
  theme_bw()


region_lang %>%
  filter(region == "Vancouver") %>%
  arrange(desc(mother_tongue)) %>%
  head()




# load the data set
#can_lang <- read_csv("data/can_lang.csv")

# obtain the 10 most common Aboriginal languages
aboriginal_lang <- filter(can_lang, category == "Aboriginal languages")
arranged_lang <- arrange(aboriginal_lang, by = desc(mother_tongue))
ten_lang <- slice(arranged_lang, 1:10)

# create the visualization
ggplot(ten_lang, aes(x = mother_tongue,
                     y = reorder(language, mother_tongue))) +
  geom_bar(stat = "identity") +
  xlab("Mother Tongue (Number of Canadian Residents)") +
  ylab("Language")








