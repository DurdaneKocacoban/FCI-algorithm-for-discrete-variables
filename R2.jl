function R2(DG)
(Xs,Zs)=findn(DG.==1);
len=length(Xs);
for i=1:len
  if(DG[Xs[i], Zs[i]]==1 && (any(DG[Xs[i],:].==2) & any(DG[:,Zs[i]]'.==2) & (any(DG[:,Xs[i]]'.==3)|any(DG[Zs[i],:].==3))))
    DG[Xs[i], Zs[i]]=2;
  end
end
return Int.(DG)
end
