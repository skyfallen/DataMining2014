#install.packages('igraph')
library(igraph)
par(mfrow = c(1,1))
g <- graph.formula(1-+2-+3,2-+4-+5-+6-+7,4-+8-+2, 
                   8-+9-+5, 8-+5, 10-+9-+11-+8-+3, 
                   4-+3, 6-+12, 9-+7,9-+6, 4 -+12, 2-+13, 14-+6, 6-+9, 15-+16, 17)

plot(g)
get.adjlist(g, mode = 'all')
run1 = graph.bfs(g, root = 8, 'out', unreachable = F)$order
run1 = cbind(run1, graph.bfs(g, root = 5, 'out',unreachable = F)$order)
run1 = cbind(run1, graph.bfs(g, root = 13, 'out',unreachable = F)$order)
which(table(run1) == 3)

ll<-data.frame(table(as.matrix(run1)))
ll = length(visited_nodes[is.na(visited_nodes) == F])
length(which(ll$Freq==1))/length(ll$Freq)

strong = clusters(g, mode="strong")
membership = strong[[1]]
sizes = strong[[2]]
which.max(sizes)
scc = which(membership==which.max(sizes))
length(scc)#22868
length(scc)/vcount(g)#fraction 26.72% yey


visited_nodes = graph.bfs(g, root = 9, 'out',unreachable = F)$order
lvs = length(visited_nodes[is.na(visited_nodes) == F])
out_component_size = (lvs - length(scc))/vcount(g)


erdos.renyi.game(5242, 14496, type = "gnm")
