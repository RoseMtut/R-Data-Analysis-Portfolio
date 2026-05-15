data(iris)
head(iris)
Sepal.Length
#This command asks:What type of data is inside this dataset?
str(iris)
#gives quick statistics like:minimum,maximum,average,quartiles
summary(iris)
#plot means draw a graph 
plot(iris$Sepal.Length, iris$Petal.Length)
# we add colour 
plot(iris$Sepal.Length,
  iris$Petal.Length,
  col = iris$Species,
  pch = 19)
#Calculate average petal length, mean()=average 
mean(iris$Petal.Length)
#Compare species averages aggregate() means summarize data by groups, The ~ symbol means:group this BY that
aggregate(Petal.Length ~ Species, data = iris, mean)
#Boxplot: This compares distributions between groups. It Show petal length differences across species
boxplot(Petal.Length ~ Species, data = iris)


