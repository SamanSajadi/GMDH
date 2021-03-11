function gmdh = GMDH (params, X, Y)

alpha = params.alpha;
Max_layer_Neourons = params.Max_layer_Neourons ; 
Max_layers = params.Max_layers  ;

shuffle = randperm (nData);
X = X(:,shuffle);
Y = Y(:,shuffle);
  %% train and test
  
pTrain = params.pTrain;
nTrain = round(pTrain*nData);
X_Train = X(:,1:nTrain);
X_Test = X(:,nTrain+1:end);
Y_Train = Y(:,1:nTrain);
Y_Test = Y(:,nTrain+1:end);
%%
Layer = cell(Max_layers,1);
nData = size (X, 2);
z_Train  = X_Train;
z_Test  = X_Test;

for l=1:Max_layers
    
 L = GetLayers(z_Train, Y_Train,z_Test, Y_Test);  

ecr = alpha *L(1).RMSE + (1-alpha)*L(end).RMSE;
ecr = max(ecr, L(1).RMSE);

L = L([L.RMSE] <= ecr);

 if numel(L) > Max_layer_Neourons
     L = L(1:Max_layer_Neourons);      
 end
 
 if l == Max_layers && numel(L) > 1
      L = L(1);
 end
 
Layer{l} = L;
 
z = reshape ([L.Yhat], nData,[])';

disp(['Layer ' num2str(l) ' :Neourons = ' num2str(numel(L)) ' , MinEror = ' ,num2str(L(1).RMSE)]);

if numel(L) == 1
    break;
end
  
end

Layer = Layer (1:l);

gmdh.Layer = Layer (1:l);

end