function sim = gaussianKernel(x1, x2, sigma)
%RBFKERNEL returns a radial basis function kernel between x1 and x2
%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim

% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

% You need to return the following variables correctly.
sim = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the similarity between x1
%               and x2 computed using a Gaussian kernel with bandwidth
%               sigma
%
%

    % Debabrata Comments - Coding Start
    % Element wise subtraction then squared output divided by 
    % bandwidth.
    
    vec_dist_temp = bsxfun(@minus,x1,x2);
    sq_vec_diff = bsxfun(@power,vec_dist_temp,2);
    denom_bandwidth = 2*power(sigma,2);
    vect_dist = exp((-1)*(sum(sq_vec_diff)/denom_bandwidth));
    % Explaination : vdt --> element wish subtraction, 
    % sq_vec_diff --> squared output element 
    % denom_bandwidth --> 2*sigma square.
    % vect_dist = sum of sq_vec_diff/denom_bandwidth : Gaussian Kernel function
    sim = vect_dist;
    
    % Debabrata Comments - Coding End
    % 

% =============================================================
    
end
