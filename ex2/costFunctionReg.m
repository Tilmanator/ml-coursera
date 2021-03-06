function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


% Take cost function and add regularization term
% First value of theta is not considered in linearization term
%J = 1.0/m* sum( -y .* log(sigmoid(X*theta)) - (ones(size(y)) - y).*log(ones(size(X*theta)) - sigmoid(X*theta))) + lambda/(2*m)*(sum(theta.^2) - theta(1)^2);
J = 1.0/m* sum( -y .* log(sigmoid(X*theta)) - (ones(size(y)) - y).*log(ones(size(X*theta)) - sigmoid(X*theta))) + lambda/(2*m)*(sum(theta(2:end).^2));

% Don't use regularization on the constant term
% Also indices start at 1
grad = 1.0/m * (X' * ( sigmoid (X*theta) - y)) + vertcat(0,lambda/m*theta(2:end));



% =============================================================

end
