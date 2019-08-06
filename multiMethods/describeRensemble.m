function [] = describeRensemble(data, index, figure_param)
    inputs = timetable2table(data.inputs_train, 'ConvertRowTimes', false);
    Mdl = fitrensemble(inputs, data.targets_train.(index), 'CrossVal', 'on');
    
    kflc = kfoldLoss(Mdl,'Mode','cumulative');
    
    % Plot EMS approaching stable during training epoches.
    figure('Name', 'FitREnsemble', 'Position', figure_param.loc);
    figure_param.refresh;
    plot(kflc);
    title('\fontsize{15} FitREnsemble Training EMS-LearningEpoches Plot', 'Interpreter', 'tex');
    ylabel('10-fold cross-validated MSE');
    xlabel('Learning cycle');
    
    % Calculate result RMES and R value.
end