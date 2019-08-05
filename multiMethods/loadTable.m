function [data] = loadTable(fn_mat, test_ratio)
    s = load(fn_mat);
    targets = s.mintsGrimmNextRadFWNode(:, 1 : 37);
    inputs = s.mintsGrimmNextRadFWNode(:, 38 : end);
    % Convert some inf values in inputs variables to max non-inf value in 
    % that variable.
    inputs.(79)(isinf(inputs.(79))) = max(inputs.(79)(~isinf(inputs.(79))));
    % Remove constant input variables.
    inputs(:, ~std(inputs{:, :})) = [];
    % Partition into inputs_train, targets_train, inputs_test, target_test.
    cv = cvpartition(height(targets), 'HoldOut', test_ratio);
    data.inputs_train = inputs(cv.training, :);
    data.inputs_test = inputs(cv.test, :);
    data.targets_train = targets(cv.training, :);
    data.targets_test = targets(cv.test, :);
end