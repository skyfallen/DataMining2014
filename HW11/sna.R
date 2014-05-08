setwd("C:/Users/v-anleon/Desktop/Tartu_University/DataMining2014/git/DataMining2014/HW11")

wiki = read.table("Wiki-Vote.txt", header = FALSE)

wiki_graph = graph.data.frame(wiki, directed = TRUE)
summary(wiki_graph)
ecount(wiki_graph)
vcount(wiki_graph)

names(wiki)=c("node_s","node_e")
wiki$u = wiki$node_s-wiki$node_e
dd = subset(wiki, u ==0)
z = sum(is.mutual(wiki_graph)*1)/2

q = which(is.mutual(wiki_graph)==TRUE)
subset(wiki, node_s==28 & node_e==3)
indegree = degree(wiki_graph, mode = c("in"))
length(which(indegree==0))
outdegree = degree(wiki_graph, mode = c("out"))
length(which(outdegree==0))
degree = degree(wiki_graph, mode = c("total"))
length(which(degree>30))
