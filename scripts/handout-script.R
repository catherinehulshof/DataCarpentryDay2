


### Creating objects in R

weight_kg <- 55
weight_kg
(weight_kg <- 55)
2.2*weight_kg
weight_lb <- 2.2 * weight_kg
weight_lb
weight_kg <- 100
weight_lb

#Challenge
mass <- 47.5
age <-  122
mass <- mass * 2.0
age <- age - 20 
mass_index <- mass/age

weight_g <- c(50,60,65,82)
animals <- c("mouse","rat","dog")
animals

length(weight_g)
length(animals)

class(weight_g)
class(animals)
str(weight_g)
str(animals)

weight_g <- c(weight_g,90)
weight_g
weight_g <- c(30,weight_g)
weight_g


### Vectors and data types
## ## We've seen that atomic vectors can be of type character, numeric, integer, and
## ## logical. But what happens if we try to mix these types in a single
## ## vector?
## 
## ## What will happen in each of these examples? (hint: use `class()` to
## ## check the data type of your object)
num_char <- c(1, 2, 3, 'a')
## 
num_logical <- c(1, 2, 3, TRUE)
## 
char_logical <- c('a', 'b', 'c', TRUE)
## 
tricky <- c(1, 2, 3, '4')
## 
## ## Why do you think it happens?
## (so R does not lose any data)
## 
## ## Can you draw a diagram that represents the hierarchy of the data
## ## types?
## 
## 
## Subsetting

animals<-c("mouse","rat","dog","cat")
animals[2]
animals[c(3,2)]
animals[c(1,2,3,2,1,4)]

weight_g <- c(21, 34, 39, 54, 50)
weight_g[c(TRUE,FALSE,TRUE,FALSE,FALSE)]
weight_g > 50

#can combine above approaches to select certain conditions:
weight_g[weight_g>50]
weight_g[weight_g>=50]

# the OR condition |
weight_g[weight_g < 30 | weight_g >= 50]
#Now, R calculates whether these conditions are TRUE, if so it preserves the values, if FALSE it does not preserve the value

# the AND conditions: &

weight_g[weight_g>30 & weight_g == 21]

# NOT: !

weight_g[! (weight_g>30 & weight_g == 21)]

animals[animals == "rat" | animals == "cat"]

#are any of the elements in the vector
animals[animals %in% c("rat","cat","duck")]

# * Can you figure out why `"four" > "five"` returns `TRUE`?

"four">"five"

#USES THE ALPHABETICAL ORDER!

#Missing data

heights <- c(2, 4, 4, NA, 6)
mean(heights)
mean(heights, na.rm=TRUE)
#looks up mean in help file

max(heights)
max(heights,na.rm=TRUE)

mean(na.omit(heights))
is.na(heights)

#Challenge
#Why does the following piece of code give an error message?
vec <- c(2,4,4,"NA",6)
mean(vec,na.rm=TRUE)
#because it recognizes the vector as character
vec <- c(2,4,4,NA,6)
mean(vec,na.rm=TRUE)

mean(c(TRUE,TRUE,FALSE,TRUE,FALSE))
mean(heights >=4,na.rm=TRUE)
sum(heights>-4,na.rm=TRUE)

### Presentation of the survey data
download.file("https://ndownloader.figshare.com/files/2292169", "data/portal_data_joined.csv")
surveys<-read.csv(file="data/portal_data_joined.csv")

head(surveys)
tail(surveys)
str(surveys)

## Challenge
## Based on the output of `str(surveys)`, can you answer the following questions?
## * What is the class of the object `surveys`? dataframe
## * How many rows and how many columns are in this object? 34786 rows, 13 columns
## * How many species have been recorded during these surveys? 40 species

### Factors
sex <- factor(c("male", "female", "female", "male"))
levels(sex)
nlevels(sex)
food <- factor(c("low", "high", "medium", "high", "low", "medium", "high"))
levels(food)
food <- factor(food, levels=c("low", "medium", "high"))
levels(food)
min(food) ## doesn't work
food <- factor(food, levels=c("low", "medium", "high"), ordered=TRUE)
levels(food)
min(food) ## works!
f <- factor(c(1, 5, 10, 2))
as.numeric(f)               ## wrong! and there is no warning...
as.numeric(as.character(f)) ## works...
as.numeric(levels(f))[f]    ## The recommended way.
## Challenge
##
## * In which order are the treatments listed?
##
## * How can you recreate this plot with "control" listed
## last instead of first?
exprmt <- factor(c("treat1", "treat2", "treat1", "treat3", "treat1", "control",
                   "treat1", "treat2", "treat3"))
table(exprmt)
barplot(table(exprmt))

exprmt <- factor(exprmt, levels=c("treat1", "treat2", "treat3", "control"))
barplot(table(exprmt))
exprmt <- factor(c("treat1", "treat2", "treat1", "treat3", "treat1", "control",
                   "treat1", "treat2", "treat3"), levels=c("treat1", "treat2", "treat3", "control"))
barplot(table(exprmt))

## The data.frame class
## Compare the output of these examples, and compare the difference between when
## the data are being read as `character`, and when they are being read as
## `factor`.
example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8))
str(example_data)
example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8), stringsAsFactors=FALSE)
str(example_data)
## ## Challenge
## ##  There are a few mistakes in this hand crafted `data.frame`,
## ##  can you spot and fix them? Don't hesitate to experiment!
author_book <- data.frame(author_first=c("Charles", "Ernst", "Theodosius"),
                               author_last=c("Darwin", "Mayr", "Dobzhansky"),
                               year=c(1942, 1970, 1956))
## ## Challenge:
## ##   Can you predict the class for each of the columns in the following
## ##   example?
## ##   Check your guesses using `str(country_climate)`:
## ##   * Are they what you expected? Why? why not?
## ##   * What would have been different if we had added `stringsAsFactors = FALSE`
## ##     to this call?
## ##   * What would you need to change to ensure that each column had the
## ##     accurate data type?
country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
                                climate=c("cold", "hot", "temperate", "hot/temperate"),
                                temperature=c(10, 30, 18, "15"),
                                northern_hemisphere=c(TRUE, TRUE, FALSE, "FALSE"),
                                has_kangaroo=c(FALSE, FALSE, FALSE, 1))

## Sequences and Subsetting data frames

### 1. The function `nrow()` on a `data.frame` returns the number of
### rows. Use it, in conjuction with `seq()` to create a new
### `data.frame` called `surveys_by_10` that includes every 10th row
### of the survey data frame starting at row 10 (10, 20, 30, ...)
###
### 2. Create a data.frame containing only the observation from 1999 of the -->
### surveys dataset.

##aggregating and analyzing data with dplyr
surveys <- read.csv(file="data/portal_data_joined.csv")

library(dplyr)
head(surveys)

#select some columns
select(surveys, plot_id,species_id,weight)

####
####
####plotting

library(ggplot2)
surveys_complete <- surveys %>% 
  filter(species_id !="",
         !is.na(weight),
         !is.na(hindfoot_length),
         sex %in% c("M","F"))

species_count <- surveys_complete %>% 
  group_by(species_id) %>% 
  tally

frequent_species <-  species_count %>% 
  filter(n >=10) %>% 
  select(species_id)

surveys_complete <-  surveys_complete %>% 
  filter(species_id %in% frequent_species$species_id)

nrow(surveys_complete)

ggplot(data=surveys_complete,
       aes(x= weight, y = hindfoot_length)) + geom_point(alpha = 0.1)

ggplot(data = surveys_complete, aes(x = species_id, y = hindfoot_length)) + 
  geom_boxplot() +
  geom_point(color="tomato", alpha = 0.3, position = "jitter")

#change order
ggplot(data = surveys_complete, aes(x = species_id, y = hindfoot_length)) + 
  geom_point(color="tomato", alpha = 0.3, position = "jitter") +  geom_boxplot()

yearly_counts <- surveys_complete %>% 
  group_by(year,species_id) %>% 
  tally

ggplot(yearly_counts,
       aes(x=year,y=n))+
  geom_line()

#whats wrong with this? we need species for each line

ggplot(yearly_counts,
       aes(x=year,y=n,
           group=species_id))+
  geom_line()

#we can improve this by adding color

ggplot(yearly_counts,
       aes(x=year,y=n,
           group=species_id,
           color=species_id))+
  geom_line()

##faceting

ggplot(yearly_counts,
       aes(x=year,y=n,
           group=species_id,
           color=species_id))+
  geom_line()+
  facet_wrap(~species_id)

yearly_sex_counts  <-  surveys_complete %>% 
  group_by(year,species_id,sex) %>% 
  tally

ggplot(yearly_sex_counts,
       aes(x=year,y=n,
           group=species_id,
           color=sex))+
  geom_line()+
  facet_wrap(~species_id)

## Challenge
## plot how the average weight of each species changes through the course of the experiment.
## Draw one line for males, and one line for females.

yearly_average_weight  <-  surveys_complete %>% 
  group_by(year,species_id,sex) %>% 
  summarize(mean_weight = mean(weight)) %>% 
  ggplot(aes(x=year,y=mean_weight,
             group=sex,
             color=sex)) +
  geom_line() +
  facet_wrap(~species_id)

ggsave("figures/yearly_weight_changes.png",width=15,height=10)


ggplot(yearly_average_weight,
       aes(x=year,y=mean_weight,
           group=species_id,
           color=sex))+
  geom_line()+
  facet_wrap(~species_id)


