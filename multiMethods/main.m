clear; close all; clc;

%--------------------------------------------------------------------------
% Set up the target variable index. (37 target variables, 1 -> pm10_grimm, etc.)
wanted_target_index = 1;

%--------------------------------------------------------------------------
% load data.
[data] = loadTable('mints_NextRadWithGrimmAndFWNode_1_1_data_from_12-Feb-2019_to_11-Apr-2019', 0.05);

% Result from fitrensemble.