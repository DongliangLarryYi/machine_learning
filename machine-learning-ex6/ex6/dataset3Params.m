function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


value = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

number = length(value);

error = zeros(number*number,1);


for i = 1:number
    C = value(i);

    for j = 1:number
        sigma = value(j);
model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
        predictions = svmPredict(model, Xval);
        index = (i-1)*number+j;
error(index) = mean(double(predictions ~= yval));

    end
end


[Min_value, Min_index] = min(error);

index_C = floor((Min_index-1)/number) + 1;
index_sigma = mod(Min_index, number);

if index_sigma == 0,
    index_sigma = number;
end

C = value(index_C);
sigma = value(index_sigma);



% =========================================================================

end
