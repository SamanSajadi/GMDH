function p = Fitpoly (x_Train, Y_Train , x_Test, Y_Test)

m_Train  = size(x_Train, 2);

    X_Train = [ones(1, m_Train)
         x_Train(1,:)
         x_Train(2,:)
         x_Train(1,:).^2
         x_Train(2,:).^2
         x_Train(1,:).*x_Train(2,:)];
  
  c = Y_Train * pinv(X_Train);
  Y_Train_hat =  c * X_Train;   % output layer 1
  
  e_Train = Y_Train - Y_Train_hat;
  MSE_Train = mean (e_Train.^2);
  RMSE_Train = sqrt(MSE_Train);
  
  p.c = c;
  p.Y_Train_hat = Y_Train_hat;
  p.MSE_Train = MSE_Train;
  p.RMSE_Train = RMSE_Train;
         
end


