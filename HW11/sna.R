setwd("C:/Users/v-anleon/Desktop/Tartu_University/DataMining2014/git/DataMining2014/HW11")
library(igraph)
virus = read.table("email_network.txt", header = FALSE)
names(virus)=c("node_s","node_e")
virus=virus[1:100,]

id_f = c(virus$node_s,virus$node_e)
mt = match(id_f, unique(sort(id_f)))
virus$node_s = mt[1:156217]
virus$node_e = mt[156218:length(mt)]

virus_graph = graph.data.frame(virus, directed = TRUE)

ecount(virus_graph)
vcount(virus_graph)


#virus$u = virus$node_s-virus$node_e
#dd = subset(virus, u ==0)

z = (sum(is.mutual(virus_graph)*1)-nrow(dd))/2

indegree = degree(virus_graph, mode = c("in"))
length(which(indegree==0))
outdegree = degree(virus_graph, mode = c("out"))
length(which(outdegree==0))
degree = degree(virus_graph, mode = c("total"))
length(which(degree>30))
#we need to calculate degree distribution
dgr = cbind.data.frame(indegree, outdegree)
dgr$node_id = row.names(dgr)

strong = clusters(virus_graph, mode="strong")
membership = strong[[1]]
sizes = strong[[2]]
which.max(sizes)
scc = which(membership==50402)
length(scc)#22868
length(scc)/vcount(virus_graph)#fraction 26.72% yey


weak = clusters(virus_graph, mode="weak")
membership_weak = weak[[1]]
sizes_w = weak[[2]]
which.max(sizes_w)
wcc = which(membership_weak==2)
disconnected = (vcount(virus_graph)-length(wcc))/vcount(virus_graph) #39.7%


#out
#get random node in scc:
#random_node = sample(length(scc),1)
#all nodes reachable from this one
bfs_out_tree = graph.bfs(virus_graph,unreachable=F, root=2, "out")
visited_nodes = bfs_out_tree$order
out_size = length(visited_nodes[is.na(visited_nodes)==FALSE])
out_component_size = (out_size - length(scc))/vcount(virus_graph)#14,4%


g <- graph.formula(1-+2-+3,1-+5-+3,1-+4-+3,5-1,5-+2,5-+4-+6-+7-+1)
plot(g) 
bfs_out_tree = graph.bfs(g, root=845, "out")
visited_nodes = bfs_out_tree$order
