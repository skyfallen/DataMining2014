#install.packages("ggplot2")
library(ggplot2)

par(mfrow = c(1,1))
# Accuracy of our classifier from 10% to 100%
accuracy = seq(0.1,1.01,0.01)
# First student:
trials = 20
sucesses = 16

data = choose(trials, sucesses)*accuracy^(sucesses)*(1 - accuracy)^(trials - sucesses)

# Probabilities to classify the test set (5 elements out of 5) with given accuracy:
trials = 5
sucesses = 5
probs = choose(trials, sucesses)*accuracy^(sucesses)*(1 - accuracy)^(trials - sucesses)
probs
# Prob of observing one out of five sets to be classified with given above probabilities 
# for one set to be classified completely
data2 = choose(5, 1)*probs^(1)*(1 - probs)^(4)

y1 = data/sum(data)
y2 = data2/sum(data2)
x = accuracy
mydf = data.frame(x, y1,y2)

p0 = ggplot(mydf, aes(x = x)) +    
  scale_colour_manual(values = c("red", "green")) +
  geom_line(aes(y = y1), colour = 'blue') +
  geom_line(aes(y = y2), colour = 'red') +
  geom_area(aes(y = y2), fill = 'green', alpha=I(.5)) +
  geom_area(aes(y = y1), fill = 'red', alpha=I(.5)) +
  xlab("Classifier accuracy") +
  ylab("Probability")
p0
