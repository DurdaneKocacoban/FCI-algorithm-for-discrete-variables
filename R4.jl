function R4(DG, sepSet, ddnc, dcol)
DG=Int.(DG);
nnodes=size(DG,2);
dir=(DG.==2) & (DG'.==3);
bidir=(DG.==2) & (DG'.==2);
for curc= 1:nnodes
    b=find(DG[curc,:].==1);
    if(isempty(b))
      continue;
    end#if(isempty(b))
    th=find(DG[curc,:].==0);
    if(isempty(th))
      continue;
    end#if(isempty(th))
    curdir=dir[:,curc]';
    G=Int.(zeros(nnodes,nnodes));
    for curth=th
        G[curth, Array(((DG[curth,:].==2)' & curdir)')]=1;
    end#for curth=th
    for d=find(curdir)
        G[reshape(bidir[d,:], nnodes),d]=1;
    end#for d=find(curdir)
    closure=transitiveClosureSparse_mex(G);
    (~,a)=findn(closure[th,:].!=0)
    if(isempty(a))
      continue;
    end#if(isempty(a))
      for curb=b
        for cura=a
          if(DG[curb,cura]==2)
             if(!isempty(find((closure[th,cura]) & (Int.(sepSet[th,curc,curb])))))
                 DG[curb, curc]=2;
                 DG[curc, curb]=3;
                 ddnc=[ddnc; cura curb curc];
             else#if(any(closure[th,cura]&sepSet[th,curc,curb]))
                 DG[curb,curc]=2;
                 DG[curc,curb]=2;
                 DG[cura,curb]=2;
                 dcol=[dcol; cura curb curc];
             end#if(any(closure[th,cura]&sepSet[th,curc,curb]))
          break
          end#if(DG[curb,cura]==2)
        end#for cura=a
      end#for curb=b
end#for curc= 1:nnodes
return Int.(DG), Int.(ddnc), Int.(dcol)
end
