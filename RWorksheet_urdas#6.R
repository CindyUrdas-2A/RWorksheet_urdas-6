install.packages("ggplot2")
library(ggplot2)
data(mpg)
as.data.frame(data(mpg))
data(mpg)
mpg

str(mpg)
library(dplyr)
glimpse(mpg)

#1.

datampg <- glimpse(mpg)

nrow(mpg)
ncol(mpg)


#2. 
num2 <- mpg %>% 
  group_by(manufacturer) %>% 
  tally(sort = TRUE)
num2

mpg$manu_mod <- paste(mpg$manufacturer,mpg$model)
unique(mpg$manu_mod)

#2a. 
datampg <- mpg
uniq_mod <- datampg %>% group_by(manufacturer, model) %>%
distinct() %>% count()
uniq_mod

#2b.
#plot()
qplot(model, data = mpg,geom = "bar", fill=manufacturer)

#ggplot()
ggplot(mpg, aes(model, manufacturer)) + geom_point()

#3a.
ggplot(mpg, aes(model, manufacturer)) + geom_point()


#3b.
ggplot(mpg, aes(model, manufacturer)) + 
  geom_point() +
  geom_jitter()

#4. 
datampg <- uniqMods %>% group_by(Model) %>% count()
datampg

#4a. 
car_mods <- qplot(model,data = mpg,main = "Number of Cars per Model", 
              xlab = "Model",ylab = "Number of Cars", geom = "bar", 
              fill = manufacturer) + coord_flip()
car_mods
#4b.
car_mods <- mpg %>% 
  group_by(model) %>% 
  tally(sort = TRUE)
car_mods

car_mods %>% print(n = 20)

#5a.
ggplot(data = mpg , mapping = aes(x = displ, y = cyl, main = "Relationship between No of Cylinders and Engine Displacement")) + 
  geom_point(mapping=aes(colour = "engine displacement")) 

#6a.
ggplot(data = mpg, mapping = aes(x = drv, y = class)) + geom_point(mapping=aes(color=class)) +
  geom_tile()

#7. 
#Code1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))

#+ Code2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")

#8.
?mpg

#8a. 

#8b. 

#c. 
ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) +
  geom_point()

#9.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping=aes(color=class)) +
  geom_smooth(se = FALSE)

#10.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  geom_smooth(se = FALSE)