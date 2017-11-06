function skeleton(data, alpha, datadf)
  Dim=size(data,2);
  L=size(data,1); # Dimension of dataset
  S=Array(Any,Dim,Dim);  #Empty set for using Probability Combinations
     for p=1:Dim, q=1:Dim
         S[p,q]=0;# as it works differently from Matlab, turned all units to zeros
     end#p=1:Dim, q=1:Dim
  DG=ones(Dim,Dim);#undirected Graph
  DG=DG-Diagonal(DG);#take Diagonal zero
  nVars=size(data,2);
  sepSet=zeros(nVars, nVars, nVars);
  pvalues=-ones(nVars, nVars);
  unistats=-ones(nVars, nVars);
  #--------------------------------------------------------------------------
  #---------Step_1=Test every Independence relations between variables-------
  #---------Step_1.1.= at first, test all variable pairs I(xi, xj)-----------
  #--------------------------------------------------------------------------
     for p=1:(Dim-1)
     for q=(p+1):Dim
        (P, GS, dfdata)=GsquareTest(data[:,p], data[:,q], datadf[p], datadf[q]);
                     if P>=alpha
                        DG[p,q]=0; DG[q,p]=0;
                     end#P>=alpha
                     pvalues[p,q]=P;
                     pvalues[q,p]=P;
                     unistats[p,q]=GS;
                     unistats[q,p]=GS;
     end#q=(p+1):Dim
     end#p=1:(Dim-1)
  #--------------------------------------------------------------------------
  #------Step_2=Conditional Indepence test--------- -------------------------
  #------Step_2.1= take out the test I(xi, xj|Nodes in path from xi to xj)---
  #--------------------------------------------------------------------------
  Run=1;
  N=1;
  g=LightGraphs.Graph(size(DG,2));
  unips=pvalues;
     for p=1:(size(DG,2)-1)
     for q=p+1:size(DG,2)
                     if DG[p,q]==1
                        LightGraphs.add_edge!(g,p,q);
                     end#DG[p,q]==1
     end#q=p+1:size(DG,2)
     end#p=1:(size(DG,2)-1)
  #--------------------------------------------------------------------------
  #--------------------------------------------------------------------------
  while Run==1
        Run=0;
        flag=0;
     for p=1:(Dim-1)
     for q=(p+1):Dim
                     if DG[p,q]==1
                        TempVector=DG[:,q]';
                        TempVector[p]=0;
                        U=find(TempVector.>0);
     for t=length(U):(-1):1
                     if a_star(g, U[t], p)==nothing#formed graph to find whether there is path between two nodes via a_star algorithm
                        U=U[1:size(U,1).!=t,:];
                    end#a_star(g, U[t], p)==nothing
     end #t=length(U):(-1):1
                     if length(U)>=N
                        flag=1;
                        Combination=collect(combinations(U,N))+1-1;#possible combinations of conditional set
     for n=1:size(Combination,1)
                      (P, GS, dfdata)=GsquareTest(data[:,p], data[:,q], data[:, Combination[n,1]], datadf[p], datadf[q], datadf[:,Combination[n,1]]);
                      if P>=alpha
                         DG[p,q]=0; DG[q,p]=0;
                         sepSet[p,q,Combination[n,1]]=1; sepSet[q,p,Combination[n,1]]=1;
                         S[p,q]=Combination[n,1];
                      break
                      else
                         (pvalues[p,q], ind)=findmax([pvalues[p,q], pvalues[q,p], P]);
                          pvalues[p,q]=pvalues[q,p];
                      end#end P>=alpha
     end# end n=1:size(Combination,1)
                      end#length(U)>=N
                      end#DG[p,q]==1
     end #q=(p+1):Dim
     end #p=1:(Dim-1)
  N=N+1;

                      if flag==1
                         Run=1
                     end#flag==1
  end#whileend
  return Int.(DG), sepSet
end#function
