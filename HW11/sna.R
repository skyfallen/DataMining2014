setwd("C:/Users/v-anleon/Desktop/Tartu_University/DataMining2014/git/DataMining2014/HW11")
library(igraph)
virus = read.table("email_network.txt", header = FALSE)

virus_graph = graph.data.frame(virus, directed = TRUE)

ecount(virus_graph)
vcount(virus_graph)

names(virus)=c("node_s","node_e")
virus$u = virus$node_s-virus$node_e
dd = subset(virus, u ==0)

z = (sum(is.mutual(virus_graph)*1)-nrow(dd))/2

indegree = degree(virus_graph, mode = c("in"))
length(which(indegree==0))
outdegree = degree(virus_graph, mode = c("out"))
length(which(outdegree==0))
degree = degree(virus_graph, mode = c("total"))
length(which(degree>30))
#we need to calculate degree distribution
indgr = as.data.frame(indegree)
indgr$node_id = row.names(indgr)

strong = clusters(virus_graph, mode="strong")
membership = strong[[1]]
sizes = strong[[2]]
which.max(sizes)
scc = which(membership==50402)
length(scc)#22868
length(scc)/vcount(virus_graph)#fraction 26.72% yey

weak = clusters(virus_graph, mode="weak")
mmbr_weak = weak[[1]]
sizes_w = weak[[2]]
which.max(sizes_w)
weak_cc = which(mmbr_weak==2)

weak_indegree = subset(indgr, node_id %in% weak_cc)
OUT = subset(weak_indegree, indegree==0)
nrow(OUT)/vcount(virus_graph) #7%
