function FastCasualInference(data, datadf)#datadf is data domain
#The PC algorithm:
#Input: Training database, mt and cmt is threshold of CI Test
#Output: a directed Graph
#Step 1. Create a complete graph G on the variables in U:
#Step 2. n:=0
#2.1. Repeat Until all ordered pairs of adjacent variables (x; y) such that
#|Ad(x)\{y}|>n and every subset S in Ad(x)\{y} have been tested for independence.
#Select an ordered pair of variables x; y adjacent in G such that |Ad(x)\{y}|< n.
#Select a subset S of Ad(x)\{y} with cardinality n. If I(x|S|y) where S is on
#the path from x to you, then erase x--y from G..
#Store S in the sets Separating(x; y) and Separating (y; x)
#2.2. n:=n+1
#Step 3. For each triplet of nodes x; y; z where x and y are adjacent,
#y and z are adjacent but x and z are not adjacent, orient x-->y<--z
#if and only if y does not belong to Separating(x; z)
alpha=0.05;
#maxK=4;
#--------------------------------------------------------------------------
#-------------------Step_1=Complete undirected graph-----------------------
#--------------------------------------------------------------------------
(DG, sepSet)=skeleton(data, alpha, datadf);
(DG, dnc, col)=R0(DG, sepSet);
#Iteratively apply rules R1-R4 until none of them applies
ddnc=[[] [] []];
dcol=[[] [] []];
DG=R1(DG);
DG=R2(DG);
DG=R3(DG);
(DG, ddnc, dcols)=R4(DG, sepSet, ddnc, dcol);
DG=R8(DG);
DG=R9_R10(DG, dnc);
pagDG=DG;
pagddnc=ddnc;
pagdcolliders=dcol;
pagcolliders=col;
pagdnc=dnc;
pagsepSet=sepSet;
return DG
end
