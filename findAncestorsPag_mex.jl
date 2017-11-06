function findAncestorsPag_mex(graph, s)
n=size(graph,2);
ancestors=Array(Any,1,n);
ancestors[:]=false
result=findAncestorsPag_mex1(graph,ancestors, s, n);
return result
end
