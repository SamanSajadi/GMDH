function L = GetLayers(X_Train, Y_Train,X_Test, Y_Test)

 n = size (X_Train, 1);
 
 N = n*(n-1)/2;
 
 temp = Fitpoly(rand(2, 3), rand(1, 3));
 L = repmat(temp, N, 1);
 
 k = 0;
  for i=1:n-1
      for j=i+1:n
          k = k+1; 
          L(k) = Fitpoly(X_Train([i j],:), Y_Train ,...
                               X_Test([i j],:), Y_Test);    
      end  
    

  end
    [~, sortorder] = sort([L.RMSE]);
    L=L(sortorder);
end

