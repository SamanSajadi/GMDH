# GMDH-
GMDH code provided in MATLAB

// a sample code to know of how to TUNE the code params!

[X, Y] = bodyfat_dataset();
nData = size (X, 2);

%% modeling and params

params.alpha = 0.6;    %selection pressure

params.Max_layer_Neourons = 20;
params.Max_layers = 50;
params.pTrain = 0.7;

%% Applying GMDH on Data

gmdh = GMDH (params, X, Y);

%% show results
plot(Y)
hold on 
plot(gmdh.Layer{end }.Yhat)
grid on

