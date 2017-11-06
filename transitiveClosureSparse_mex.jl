function transitiveClosureSparse_mex(graph)
V=size(graph,2);
reach=graph;
for k=1:V
for i=1:V
for j=1:V
    reach[i,j]=Int.(reach[i,j]) | (Int.(reach[i,k]) & Int.(reach[k,j]));
end
end
end
return reach
end
