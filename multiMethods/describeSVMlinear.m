function [RMSE, R] = describeSVMlinear(data, index)
    inputs = timetable2table(data.inputs_train, 'ConvertRowTimes', false);
    Mdl = fitrlinear(inputs{:, :}, data.targets_train.(index));
    
    inputs_test = timetable2table(data.inputs_test, 'ConvertRowTimes', false);
    target_fit = predict(Mdl, inputs_test{:, :});
    target_test = data.targets_test.(index);
    RMSE = sqrt(mean((target_fit-target_test).^2));
    R = corrcoef(target_fit, target_test);
    R = R(1,2);
end

% Mdl = fitrlinear(table2array(k_folder(:,1:end-1)), table2array(k_folder(:, end)));
