function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Debabrata Comments - Coding Start
% We know that in Neural Network the costfunction is represented by 
% j(theta)=(1/m)(SUM[1:m](SUM[1:k]([y(k)(i)log(h(theta)(x(i))(k))-(1-y(k)(i))log(1-h(theta)(x(i))(k))]))
    
    
    % This is not a for loop process and rather use vectorised implementation.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % nn_params = 1*10285 (1 by element theta1 + elements in theta2)
    % theta1 = 25*401 -- 1 extra col then same level input viz. X=5000*400
    % theta2 = 10*26
    % y = 5000*1
    % Y = 5000*10 derived from y
    % m =5000 derived from no. of rows in X
    % J - 1*1
    % theta1_grad = size(theta1) = 25*401
    % theta2_grad = size(theta2) = 10*26
    % a1 = X+1extra bias col = 5000*401
    % z2=5000*25
    % a2=5000*25 add bias unit so 5000*26
    % z3 = 5000*10
    % h = a3 = 5000*10
    % pnlt = 1*1
    % after J calculation we do J = J + pnlt = 1*1
    % dlt3 = 5000*10 same as h or Y
    % dlt2 = 5000*26 note dlt2 = dlt3*theta2.*sigmoidGradient([1 z2])
    % dlt2 remove the bias so 5000*25
    % DELTA1 = 25*401
    % DELTA2 = 10*26
    % p1 = 25*401 penalty for delta
    % p2 = 10*26 penalty for delta
    % theta1_grad = DELTA1 = p1 = 25*401
    % theta2_grad = DELTA2 = p2 = 10*26
    % all multiplication of matrix will get clear once we understand the matrix dimensions.
    % Hope it helps. The test case from ex3 does not use above dimensions its a smaller version of 4*5 and 4*3.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Feedforward
    %calculate h(theta)
    a1 = [ones(m,1) X]; % add bias factor
    z2 = a1*Theta1'; % get z via X*theta'
    a2 = sigmoid(z2); % calculate activation matrix 
    m2 = size(a2,1); % rows in activation vector
    a2_bias = [ones(m2,1) a2]; % add bias factor
    
    z3 = a2_bias*Theta2'; % get 3rd level z value.
    a3 = sigmoid(z3); % calculate final matrix
    h = a3; % assign a3 to h our final outcome hypothesis
    
    %create Y matrix from y vector m*num_lables matrix with Y[i,x]=1 if y(i) = x and 0 for Y[i,q] where q!=x
    for i=1:m
        Y(i,:)=[1:num_labels]==y(i);
    end
    
    % calculate unregularized cost function
    J = (1/m)*sum(sum((-Y).*log(h)-(1-Y).*log(1-h))); %called as cost function
    
    % [0;theta(2:end)] theta with first value not to be considered for penalty
    % or temp = theta; temp(1) = 0 both works
    
    % penalty is penalty for theta1 and theta2. Remember to ignore bias factor calculation in penalty calculation.
    
    % Calculate penalty
    pnlt = ((lambda)/(2*m)).*(sum(sum(Theta1(:,2:end).^2))+sum(sum(Theta2(:,2:end).^2))); % penalty for cost function.
     
    %calculate regularized costfunction
    J = J + pnlt; % add penalty to cost function.
    
    
    
    % backpropagation code scripts
    dlt3 = h - Y; % delta3 is h(x)-y.
    dlt2 = dlt3 * Theta2.*sigmoidGradient([ones(m2,1) z2]);
    dlt2_unbias = dlt2(:,2:end);
    
    %DELTA gradient accumulation
    DELTA1 = (1/m)*(dlt2_unbias' * a1);
    DELTA2 = (1/m)*(dlt3' * a2_bias);
    
    
    %penalty to be added
    p1 = (lambda/m)*[zeros(size(Theta1,1),1) Theta1(:,2:end)];
    p2 = (lambda/m)*[zeros(size(Theta2,1),1) Theta2(:,2:end)];
    Theta1_grad = DELTA1 + p1;
    Theta2_grad = DELTA2 + p2;
    
% Debabrata Comments - Coding End
% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
