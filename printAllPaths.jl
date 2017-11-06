# all paths from a source to destination.
function printAllPaths(self, s, d)
# Mark all the vertices as not visited
visited=Array(Any,length(vertices(self)))';
visited[:]=false;
path = Int64[];
# Call the recursive helper function to print all paths
printAllPathsUtil(self, s, d, visited, path)
end#rintAllPaths(self, s, d)
