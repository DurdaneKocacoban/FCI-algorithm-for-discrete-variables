function R3(DG)
(Ths,Ys)=findn(DG.==1);
nedges=length(Ths);
for i=1:nedges
  a=find(DG[:,Ths[i]].==1 & DG[:,Ys[i]].==2);
  len=length(a);
  f=false;
  for j=1:len
       for k=j+1:len
           if(DG[a[j], a[k]]==0 && DG[Ths[i],Ys[i]]==1)
              DG[Ths[i], Ys[i]]=2;
              f=true;
           break;
           end
       end
  end
           if(f)
               break;
           end
end
return Int.(DG)
end
