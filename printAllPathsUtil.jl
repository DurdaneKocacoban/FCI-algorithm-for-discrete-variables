function printAllPathsUtil(self, u, d, visited, path)
visited[u]= true;
append!(path,u);
# If current vertex is same as destination, then print
# current path[]
if u==d
   println(path)
else
end#u==d:
# If current vertex is not destination
#Recur for all the vertices adjacent to this vertex
for i=vertices(self)
if (visited[i]==false)
printAllPathsUtil(self, i, d, visited, path)
end#visited[i]==false:
pop!(path);
visited[u]=false
end#i=vertices(self)
# Remove current vertex from path[] and mark it as unvisited
# Prints all paths from 's' to 'd'
end#printAllPathsUtil(self, u, d, visited, path)
