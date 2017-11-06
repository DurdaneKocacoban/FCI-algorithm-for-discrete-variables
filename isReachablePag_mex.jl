function isReachablePag_mex(graph, s, t)
n=size(graph,2);
visited=Array(Any,n);
visited[:]=false;
visited[t]=true;
result=false;

for cur=1:n
  if ((!visited[cur]) && (graph[s,cur]==2) && (graph[cur,s]==3))
     if (s==cur)
     return;
   elseif ((graph[cur,t]==2) && (graph[t,cur]==3))
      result=true;
     end
 end
 end
return result
end#function
