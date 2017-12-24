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

% Debabrata Comments - Coding Start
% Regularisation factor to add lambda/2m * theta2 note theta2 is theta'*theta.
% Also gradient descent to be used with regularization factor. Please use the formula from notes.
    h = sigmoid(X*theta);
    %Calculate the lambda term aka penalty
    %in order to not penalize theta0 use 0 for the first index and get the rest for use.
    newtheta=[0;theta(2:size(theta))];
    pnlt = (lambda/(2*m))*(newtheta'*newtheta);
    
    J = ((1/m)*((-y)'*log(h)-(1-y)'*log(1-h)))+pnlt
    
    grad = (1/m)*((X')*(h-y) + lambda*newtheta);

% Debabrata Comments - Coding End
% 

% =============================================================

end
