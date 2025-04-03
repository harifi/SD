% Star Death (SD) algorithm
%
% Authors : Sasan Harifi, Reza Eghbali, Seyed Mohsen Mirhosseini
%
% Paper  : Star Death: a novel lightweight metaheuristic algorithm and its
%          application for dynamic load-balancing in cluster computing
% DOI    : http://dx.doi.org/10.1007/s10586-025-05265-5
%
% Copyright (c) 2025, All rights reserved.
% Please read the "license.txt" for license terms.
% -------------------------------------------------------------------------
% This demo only implements a standard version of SD for minimization of
% some standard test functions on MATLAB R2024b.
% -------------------------------------------------------------------------
% Note:
% Due to the stochastic nature of metaheuristc algorithms, different runs
% may lead to slightly different results.
% -------------------------------------------------------------------------

clc;
clear;
close all;

%% Star Death (SD) parameters
NumPhotons = 20;                      % Number of Decision Variables (Solutions)
MaxIteration = 100;                   % Maximum Number of Iterations
AbsorptionRate = 1;                   % Absorption Rate (Step Rate) between 1 to 4 results is better
BestOptimal = zeros(1,MaxIteration);  % Array to Hold Best Solution ever found
rng(1);

%% Set benchmark function (Problem definition)
[VarMin,VarMax,Dim,CostFunction] = Benchmark_functions(1); 	% Change number from 1 to 23 for different benchmark functions

%% Initialization
if size(VarMax,2)==1
    Positions=rand(NumPhotons,Dim).*(VarMax-VarMin)+VarMin;
else
    for i=1:Dim
        VarMax=VarMax(i);                                          % Upper Bound of Decision Variables
        VarMin=VarMin(i);                                          % Lower Bound of Decision Variables
        Positions(:,i)=rand(NumPhotons,1).*(VarMax-VarMin)+VarMin; % Initialize Position (Generate Random Solution)
    end
end

% Initialize Elite and Center photons of star
ElitePosition=zeros(1,Dim);
EliteStar=inf;
CenterPosition=zeros(1,Dim);
CenterStar=inf;

%% Main Loop of Star Death (SD) Algorithm
% STEP 1
for Iteration=1:MaxIteration
    % STEP 2
    for i=1:NumPhotons
        % Apply Positions Limits
        Positions(i,:) = max(Positions(i,:), VarMin);
        Positions(i,:) = min(Positions(i,:), VarMax);
        Cost=CostFunction(Positions(i,:));            % Calculate cost function
        
        % Update Elite and Center photons of star
        if Cost<EliteStar
            EliteStar=Cost;
            ElitePosition=Positions(i,:);
        else
            CenterStar=Cost;
            CenterPosition=Positions(i,:);
        end
    end
    % END STEP 2
    
    AP = exp(-(2*Iteration/MaxIteration)^2);          % Adaptive Parameter
    
    % STEP 3
    for i=1:NumPhotons
        % STEP 4
        for j=1:Dim
            
            LuminosityRate = 2*AbsorptionRate*rand();
            EmitterRate= AbsorptionRate*rand()-1;
            Luminiosity= LuminosityRate*ElitePosition(j)-Positions(i,j);   % Update Luminiosity
            Emitter = AP*EmitterRate*Luminiosity;                          % Update Emitter
            EliteStarPosition=ElitePosition(j)- AP*Emitter;                % Update Elite Position
            
            DensityRate = 2*AbsorptionRate*rand();
            FusionRate= AbsorptionRate*rand()-1;
            Density= DensityRate*CenterPosition(j)-Positions(i,j);         % Update Density
            Fusion = AP*FusionRate*Density;                                % Update Fusion
            CenterStarPosition=CenterPosition(j)-AP*Fusion; 		       % Update Center Position
            
            Positions(i,j)=(EliteStarPosition+CenterStarPosition)/2;       % Claculate Mean position
        end
        % END STEP 4
    end
    % END STEP 3
    
    BestOptimal(Iteration)=EliteStar;                                      % Store the Best Cost Value
    display(['Optimal cost funciton of SD : ', num2str(EliteStar)]);       % Display Progress
end
% END STEP 1

%% Plot Results
figure;
semilogy(BestOptimal,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');