# FCI-algorithm-for-discrete-variables
# Packages
###### Pkg.add("BayesNets");
###### Pkg.add("LightGraphs");
###### Pkg.add("TikzGraphs");
###### Pkg.add("TikzPictures");
###### Pkg.add("HypothesisTests");
###### Pkg.add("GSL");
###### Pkg.add("RobustShortestPath");
###### Pkg.add("Combinatorics");
###### Pkg.add("FastCombinations");
###### Pkg.add("Iterators");
###### Pkg.add("Graphs");
###### Pkg.add("CPUTime");
###### Pkg.add("Rmath");
###### Pkg.add("InformationMeasures");
###### Pkg.add("CodeTools");

###### using BayesNets
###### using LightGraphs
###### using TikzGraphs
###### using TikzPictures
###### using HypothesisTests
###### using GSL
###### using RobustShortestPath
###### using Combinatorics
###### using FastCombinations
###### using Iterators
###### using Graphs
###### using CPUTime
###### using Rmath
###### using InformationMeasures
###### using CodeTools

###### cd("/Users/ ... /FCI-algorithm-for-discrete-variables");
###### dataset=readtable("alarmnetworkdata.csv");
###### datadomain=readtable("alarmnetworkdatadomain.csv");
###### datadomain=convert(Array,datadomain);
# FCI-Start-Files
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/transitiveClosureSparse_mex.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/orientDnc_mex.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/isReachablePag_mex.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/skeleton.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/findAncestorsPag_mex.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/findAncestorsPag_mex1.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/R0.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/R1.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/R2.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/R3.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/R4.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/R8.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/R9_R10.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/FastCausalInference.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/GsquareTest.jl");
  ###### include("/Users/ ... /FCI-algorithm-for-discrete-variables/IC.jl");
