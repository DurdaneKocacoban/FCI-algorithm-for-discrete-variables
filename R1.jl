
function R1(DG)
(Xs,Ys)=findn(DG.==1)
len=length(Xs);
for i=1:len
  if(DG[Xs[i], Ys[i]]==1 && (any(DG[:,Ys[i]].==2) & any(DG[:,Xs[i]].==0)))
    DG[Ys[i], Xs[i]]=2;
    DG[Xs[i], Ys[i]]=3;
  end
end
return Int.(DG)
end
