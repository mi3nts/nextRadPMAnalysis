function [k_folder, test] = loadTable(fn_mat, test_ratio)
    load(fn_mat, 'In', 'Out', 'usednames');
    Data = [In Out];
    names = [usednames 'pollen'];
    data = array2table(Data, 'VariableNames', names);
    clear Data names fn_mat In Out usednames;
    data = rmmissing(data);
    cv = cvpartition(height(data), 'HoldOut', test_ratio);
    k_folder = data(cv.training, :);
    test = data(cv.test, :);
end