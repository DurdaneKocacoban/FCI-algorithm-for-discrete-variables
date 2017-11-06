function orientDnc_mex(graph, x, y)
n=size(graph,2);
for cur=1:n
if (graph[cur,x]==0 && graph[cur,y]==1)
graph[y,cur]=2;
graph[cur,y]=3;
end#if (graph[x,cur]==0 && graph[y,cur]==1)
end#for cur=1:n
return graph
end#function
