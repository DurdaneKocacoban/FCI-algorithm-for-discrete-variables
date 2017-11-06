function GsquareTest(vec1,vec2,dfvec1,dfvec2)#independence test, vec1 is vector
rsz1=size(vec1,1);#row size
rsz2=size(vec2,1);
d1=[vec1 vec2];
C=unique(d1,1);#C is unique rows in d1 matrix
ic=Int.(IC(d1));#ic returns index vector using C, d1=C[ic,:]
entropy=0;
dfdata=(dfvec1-1)*(dfvec2-1);#degrees of freedom
if rsz1!=rsz2
   return
else
   for i=1:maximum(ic)
#gsquare formula reference:R.E. Neapolitan (2004). Learning Bayesian Networks.
#Prentice Hall Series in Artificial Intelligence. Chapter 10.3.1
        pxy=sum(ic.==i);
        pdp=(pxy*rsz1)/(sum(vec1.==C[i,1])*sum(vec2.==Any[C[i,2]]));
        ent=pxy*log(pdp);
        entropy=entropy+ent;
    end
    GS=2*entropy;#gsquare value
    P=Rmath.pchisq(GS, dfdata, false);#P cumulative distribution function of the chi-square distribution 
end
    return P, GS, dfdata
end
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
#--------------------------------------------------------------------------
function GsquareTest(vec1,vec2,vec3,dfvec1,dfvec2,dfvec3)#conditional independence test
d0=[vec1 vec2 vec3];
d2=[vec2 vec3];
d3=[vec1 vec3];
rsz1=size(vec1,1);
rsz2=size(vec2,1);
rsz3=size(vec3,1);
csz1=size(vec1,2);
csz3=size(vec3,2);
cd0=size(d0,2);
cd2=size(d2,2);
cd3=size(d3,2);
C=unique(d0,1);
ic=Int.(IC(d0));
entropy=0;
dfdata=(dfvec1-1)*(dfvec2-1)*prod(dfvec3);
if rsz1!=rsz2!=rsz3
    return
else
    for i=1:Int.(maximum(ic))
        pxyz=sum(ic.==i);
        if csz3==1     pz=sum(convert(Array,C[i,cd0-csz3+1:cd0]).==vec3);
        else          pz=sum(Int.(mapslices(elem -> elem == vec(convert(Array,C[i,cd0-csz3+1:cd0])), vec3, 2)));
        end
        pxz=sum(Int.(mapslices(elem -> elem == vec(convert(Array,[C[i, 1:csz1]' C[i, cd0-csz3+1:cd0]'])), d3, 2)));
        pyz=sum(Int.(mapslices(elem -> elem == vec(convert(Array,C[i,cd0-cd2+1:cd0])), d2, 2)));
        pdp2=(pxyz*pz)/(pxz*pyz);
        ent=pxyz*log(pdp2);
        entropy=entropy+ent;
    end
end
GS=2*entropy;
P=Rmath.pchisq(GS, dfdata, false);
    return P, GS, dfdata
end
