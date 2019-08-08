function [RMSE, R] = describeTreeBagger(data, index, figure_param)
    Mdl = TreeBagger(50, ...
        timetable2table(data.inputs_train, 'ConvertRowTimes', false), ...
        data.targets_train.(index),...
        'Method', 'regression',...
        'OOBPredictorImportance', 'on');
    
    % Plot MSE - number of trees.
    oob_error = oobError(Mdl);
    figure('Name', 'Tree Bagger OOB Error', 'Position', figure_param.loc);
    figure_param.refresh;
    plot(oob_error, 'LineWidth', 2);
    xlabel('Number of Trees','FontSize',30);
    ylabel('Out of Bag Error','FontSize',30);
    title('Out of Bag Error','FontSize',30);
    set(gca,'FontSize',32);
    set(gca,'LineWidth',2);
    
    % Calculate RMSE and R.
    target_fit = predict(Mdl, timetable2table(data.inputs_test, 'ConvertRowTimes', false));
    target_test = data.targets_test.(index);
    RMSE = sqrt(mean((target_fit-target_test).^2));
    R = corrcoef(target_fit, target_test);
    R = R(1,2);
end