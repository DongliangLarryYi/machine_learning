function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 






% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

%z = 0;
g = zeros(size(z));

exponetial = exp(-z);
temp = exponetial + 1;
g = 1./temp;


% =============================================================

end
