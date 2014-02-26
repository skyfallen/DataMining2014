#install necessary packages (run only once)
install.packages("arules")
install.packages("arulesViz")

#load datafrom the url
data_url = url("https://courses.cs.ut.ee/MTAT.03.183/2014_spring/uploads/Main/titanic.txt")
titanic = read.table(data_url, sep =',', header = TRUE)

#observe the data
##first 6 observations
head(titanic)
#types of features
str(titanic)
#dimensionality of the data
dim(titanic)

#load package for frequent set mining
library(arules)
#help with apriori
?apriori
#run apriori algorithm with default settings
rules = apriori(titanic)
#inspection of the result
inspect(rules)

#now let us assume, we want to see only those rules that have rhs as survived:
rules = apriori(titanic,appearance = list(rhs=c("Survived=No", "Survived=Yes"),default="lhs"))
inspect(rules)

#let us relax the default settings for the rules we are looking for
rules = apriori(titanic,parameter = list(minlen=2, supp=0.05, conf=0.8),appearance = list(rhs=c("Survived=No", "Survived=Yes"),default="lhs"))

#visualization
library(arulesViz)
plot(rules, method="graph", control=list(type="items"))

rules.sorted = sort(rules, by="lift")
subset.matrix = is.subset(rules.sorted, rules.sorted)

nonredundant = row.names(subset.matrix)[-c(2,3,5)]
rules.pruned = rules.sorted[c(1,4,6)]



