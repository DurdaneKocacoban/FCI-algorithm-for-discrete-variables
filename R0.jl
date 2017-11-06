function R0(DG, sepSet)
nVars = size(DG,2);
unshieldedtriples = Array(Any,nVars);
unshieldedpairs = zeros(nVars*nVars,2);
for i = 1:nVars
    neighbours = find(DG[i,:]);
    nneighbours = length(neighbours);
    curindex=1;
      for n1 = 1:nneighbours
        curn1 = neighbours[n1];
        for n2 = n1+1:nneighbours
            curn2 = neighbours[n2];
            if(DG[curn1,curn2] == 0)
                unshieldedpairs[curindex,1] = curn1;
                unshieldedpairs[curindex,2] = curn2;
                curindex = curindex + 1;
            end
        end
    end
    unshieldedtriples[i] = unshieldedpairs[1:curindex-1,:];
end
dnc=[NaN for i=1:binomial(nVars, 3), j=1:3];
col=[NaN for i=1:binomial(nVars, 3), j=1:3];
iCol =0; iDnc =0;
for c = 1:nVars
    curtriples = unshieldedtriples[c];
    ntriples = size(curtriples,1);
    for t = 1:ntriples
        a = curtriples[t,1];
        b = curtriples[t,2];
        a=convert(Int64,a);
        b=convert(Int64,b);
        if sepSet[a, b, c]==1
            iDnc = iDnc+1;
            dnc[iDnc, :] = [a c b];
        else
            iCol = iCol+1;
            col[iCol, :] = [a c b];
            DG[a,c] = 2;
            DG[b,c] = 2;
        end
    end
end
dnc = dnc[1:iDnc, :];
col = col[1:iCol, :];
return Int.(DG), dnc, col
end
