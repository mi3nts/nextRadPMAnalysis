function [RMSE, R] = describeRensemble(data, index, figure_param)
    inputs = timetable2table(data.inputs_train, 'ConvertRowTimes', false);
    target = data.targets_train.(index);
    Mdl = fitrensemble(inputs, target, 'CrossVal', 'on');
    
    kflc = kfoldLoss(Mdl,'Mode','cumulative');
    
    % Plot EMS approaching stable during training epoches.
    figure('Name', 'FitREnsemble', 'Position', figure_param.loc);
    figure_param.refresh;
    plot(kflc);
    title('\fontsize{15} FitREnsemble Training EMS-LearningEpoches Plot', 'Interpreter', 'tex');
    ylabel('10-fold cross-validated MSE');
    xlabel('Learning cycle');
    
    % Train another tree with fitrensemble.
    Mdl2 = fitrensemble(inputs, target, 'CrossVal', 'off');
    
    % Calculate result RMES and R value.
    target_fit = predict(Mdl2, timetable2table(data.inputs_test, 'ConvertRowTimes', false));
    target_test = data.targets_test.(index);
    RMSE = sqrt(mean((target_fit-target_test).^2));
    R = corrcoef(target_fit, target_test);
    R = R(1,2);
end