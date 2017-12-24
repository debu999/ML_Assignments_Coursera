function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);
size(Theta1); %25   401
size(Theta2) ; %10   26
size(X) ;%5000    400
% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
 % Debabrata Comments - Coding Start
% get activatioon matrix with one padded X.
%get h(x) with one paded activation matrix and theta2.
% use max function to get exact values of prediction column sum. ideally p contains the index 
% since 1=index 1 and 0=index 10 it works out well with max func.   
    %Add ones to for X0
    %from notes If network has sj units in layer j, sj+1 units in layer j+1, 
    %then Theta(j) will be of dimension s(j+1) * s(j) + 1 add ones to X
    X = [ones(m,1) X];
    z = X*Theta1';
    act_mtrx = sigmoid(z);
    m2 = size(act_mtrx,1);
    %Add ones to for activation_matrix of layer 2
    %from notes If network has s(j) units in layer j, s(j+1) units in layer j+1, 
    %then Theta(j) will be of dimension s(j+1) * s(j) + 1 add ones to X
    act_mtrx2 = [ones(m2,1) act_mtrx];
    size(act_mtrx2);
    h = act_mtrx2*Theta2';
    size(h);
    [pval, p] = max(h,[],2);
% Debabrata Comments - Coding End
% 
% =========================================================================


end
