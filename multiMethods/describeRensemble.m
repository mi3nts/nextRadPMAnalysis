function [] = describeRensemble(data, index)
    inputs = timetable2table(data.inputs_train, 'ConvertRowTimes', false);
    Mdl = fitrensemble(inputs, data.targets_train.(index), 'CrossVal', 'on');
    
    kflc = kfoldLoss(Mdl,'Mode','cumulative');
    figure;
    plot(kflc);
    ylabel('10-fold cross-validated MSE');
    xlabel('Learning cycle');
end