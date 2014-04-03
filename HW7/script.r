data = read.table('C:\\Tartu Ulikool\\Data Mining\\DataMining2014\\HW7\\Shuffled.txt', sep = ' ', header = FALSE,comment.char = "r")
data = data[-1]
head(data)
rownames(data) = paste('rev',seq(0,length(data[,1])-1),sep = '')

install.packages('seriation')
library(seriation)

d = dist(data)
head(d)
o = seriate(d, method = "BBWRCG")

result = rownames(data[get_order(o),])
write.table(result, 'C:\\Tartu Ulikool\\Data Mining\\DataMining2014\\HW7\\seriation.txt', row.names = F, col.names = F, quote = F)

hc = hclust(d, method = 'single')
get_order(hc)
result = rownames(data[get_order(hc),])
write.table(result, 'C:\\Tartu Ulikool\\Data Mining\\DataMining2014\\HW7\\hclust.txt', row.names = F, col.names = F, quote = F)
