% Train a linear regression model. By default, fitrlinear uses support 
% vector machines with a ridge penalty, and optimizes using dual SGD for 
% SVM. Determine how well the optimization algorithm fit the model to the 
% data by extracting a fit summary.

Mdl = fitrlinear(table2array(k_folder(:,1:end-1)), table2array(k_folder(:, end)));
