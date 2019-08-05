function [inputs, targets] = loadTable(fn_mat)
    s = load(fn_mat);
    targets = s.mintsGrimmNextRadFWNode(:, 1 : 37);
    inputs = s.mintsGrimmNextRadFWNode(:, 38 : end);
    % Convert some inf values in inputs variables to max non-inf value in 
    % that variable.
    inputs.(79)(isinf(inputs.(79))) = max(inputs.(79)(~isinf(inputs.(79))));
    % Remove constant input variables.
    inputs(:, ~std(inputs{:, :})) = [];
end