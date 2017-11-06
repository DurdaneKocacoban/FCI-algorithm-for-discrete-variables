function R8(DG)
(r,c)=findn((DG.==2) &  (DG'.==1));
nedges=length(r);
for i=1:nedges
  out=findn(DG[:,r[i]].==3);
  if(any(DG[out,c[i]].==2) & any(DG[c[i],out]'.==3))
    DG[c[i], r[i]]=3;
  end
end
return Int.(DG)
end
