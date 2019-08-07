clear; close all; clc;

%--------------------------------------------------------------------------
% Set up the target variable index. (37 target variables, 1 -> pm10_grimm, etc.)
wanted_target_index = 1;

% Set up figures alignment.
figure_param = FigureParam(get(groot, 'ScreenSize'), 5, 5, 10, 10);

%--------------------------------------------------------------------------
% load data.
[data] = loadTable('mints_NextRadWithGrimmAndFWNode_1_1_data_from_12-Feb-2019_to_11-Apr-2019', 0.05);

% Result from fitrensemble.
[RMSE, R] = describeRensemble(data, wanted_target_index, figure_param);
result.fitrensemble_RMSE = RMSE;
result.fitrensemble_R = R;
clear RMSE R;

% Result from SVM.
[RMSE, R] = describeSVMlinear(data, wanted_target_index);
result.svm_RMSE = RMSE;
result.svm_R = R;
clear RMSE R;

% Result from tree bagger.
[RMSE, R] = describeSVMlinear(data, wanted_target_index);
result.treebagger_RMSE = RMSE;
result.treebagger_R = R;
clear RMSE R;

% Result from neural network.
