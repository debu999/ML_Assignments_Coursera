function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

theta = zeros(size(X, 2), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%

% ---------------------- Sample Solution ----------------------
% Debabrata Comments - Coding Start
% Theta is straight forward per equation in course. Pinv will give
% approximate value if X'*X cant be inversed. Its cool to use the same if inv function fail.
% not all matrix can be inversed thus probable inverse is best way to deal such issue.
theta = pinv(X'*X)*X'*y
% Debabrata Comments - Coding End


% -------------------------------------------------------------


% ============================================================

end
