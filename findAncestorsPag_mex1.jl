function findAncestorsPag_mex1(graph,ancestors, s, n)
for cur=1:n
  if ((~ancestors[cur]) && (graph[s,cur]==2) && (graph[cur,s]==3))
     ancestors[cur]=true;
     findAncestorsPag_mex1(graph,ancestors, cur, n);
  end
end
return Int.(ancestors)
end
