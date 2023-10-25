library(dplyr)

iris <- read.csv('iris.csv')
iris

# Question 1
iris %>%
  summarise(
    TotalRows = n(),
    TotalColumns = ncol(.),
    SepalLengthMean = mean(sepal_length),
    SepalWidthMean = mean(sepal_width),
    PetalLengthMean = mean(petal_length),
    PetalWidthMean = mean(petal_width)
  )

# 5 columns: 
  # sepal_length: measures sepal length in cm
  # sepal_width: measures sepal width in cm
  # petal_length: measures petal length in cm
  # petal_width: measures petal width in cm
  # species: the species of flower that this flower is

# Question 2 
niris <- iris %>%
  select(species, sepal_length, sepal_width) %>%
  arrange(desc(sepal_length))
niris

#Question 3
vers <- niris %>%
  mutate(versicolor = ifelse(species == 'Iris-versicolor', 1, 0)) %>%
  select(-sepal_length, -sepal_width)
vers

# Question 4
petal_3 <- iris %>%
  filter(petal_width == 0.3)
petal_3

# Question 5
healsep <- iris %>%
  filter(sepal_width > 3) %>%
  arrange(sepal_width) %>%
  head(5)
healsep

# Question 6
avgiris <- iris %>%
  group_by(species) %>%
  summarise(avg_petal_length = mean(petal_length),
            sd_petal_length = sd(petal_length, na.rm = TRUE),
            avg_petal_width = mean(petal_width),
            sd_petal_width = sd(petal_width, na.rm = TRUE))
avgiris


# Question 7        
# In this next chunk of code, I will call a count() function to see how many of each species we have
spec_count <- iris %>%
  count(species, sort = TRUE)
spec_count

# Then, I will call a left_join() function to add the count data to the avgiris data 
avgiris <- avgiris %>%
  left_join(spec_count, by = 'species')
avgiris

# rlang::last_trace()