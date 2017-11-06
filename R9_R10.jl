function R9_R10(DG, dnc)
#--------------------------------------------------------------------------
#--------------------------------R9----------------------------------------
#--------------------------------------------------------------------------
  (r,c)=findn(DG.==2 & DG'.==1);
  nedges=length(r);
  tmpgraph=Int.(zeros(size(DG,2),size(DG,2)));
  for i=1:nedges
    tmpgraph[:,:]=DG[:,:];
    tmpgraph[c[i], r[i]]=2;
    tmpgraph=orientDnc_mex(tmpgraph, c[i], r[i]);
    if(isReachablePag_mex(tmpgraph, r[i], c[i]))
          DG[c[i], r[i]]=3;
        end#if(isReachablePag_mex(tmpgraph, r(i), c(i)))
  end#for i=1:nedges
possibleClosure=transitiveClosureSparse_mex(((DG.==1) & (DG'.!=2))|((DG.==2) & (DG'.==3)));
#--------------------------------------------------------------------------
#-----------------------R10 starts from here-------------------------------
#--------------------------------------------------------------------------
  closures=zeros(size(DG,2),size(DG,2));
  tested=(similar(BitArray, (size(DG,2))));
  tmpgraph2=zeros(size(DG,2),size(DG,2));
  tmpgraph3=zeros(size(DG,2),size(DG,2));
  if isempty(dnc); return; end#isempty(dnc)
      for s=1:size(DG,2)
            tested[:]=false;
            curDnc=dnc[in.(dnc[:,2], [s]),:];
            ndnc=size(curDnc,1);
      for t=find((DG[:,s]'.==1) & (DG[s,:]'.==2))
      for j=1:ndnc
           a=Int.(curDnc[j,1]);
           b=Int.(curDnc[j,3]);
           if((!possibleClosure[a,t])||(!possibleClosure[b,t])||DG[a,s]==2||DG[b,s]==2||a==t||b==t)
             continue;
           end#((~possibleClosure
           if(!tested[a])
              tmpgraph2[:,:]=DG[:,:];
              tmpgraph2[s,a]=2;
              tmpgraph2[a,s]=3;
              tmpgraph2=orientDnc_mex(tmpgraph2,s,a);
              closures[a,:]=findAncestorsPag_mex(tmpgraph2,s);
              tested[a]=true;
           end#(~tested(a))
           if(!convert(Bool,closures[a,t]))
                continue;
           end#(~closures[a,t])
           if(!tested[b])
              tmpgraph3[:,:]=DG[:,:];
              tmpgraph3[s,b]=2;
              tmpgraph3[b,s]=3;
              tmpgraph3=orientDnc_mex(tmpgraph3,s,b);
              closures[b,:]=findAncestorsPag_mex(tmpgraph3,s);
              tested[b]=true;
           end#(~tested(b))
           if(!convert(Bool,closures[b,t]))
              continue;
           end#(~closures[b,t])
      DG[t,s]=3;
      break;
      end#j=1:ndnc
      end#t=find((DG[:,s]'.==1) & (DG[s,:].==2))
      end#s=1:size(DG,2)
return DG
end
