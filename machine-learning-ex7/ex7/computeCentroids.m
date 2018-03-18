function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
    % Debabrata Comments - Coding Start
    %
    % =============================================================
    % Get Mean from the Data Set and centroid index
    
    
    for centroididx = 1:K
      idx_tmp=idx==centroididx;
      el_cnt = size(idx(idx_tmp,1),1);
      centroids(centroididx,:)= sum(X(idx_tmp,:))/el_cnt;
    end
    % Debabrata Comments - Coding End
    %
    % =============================================================







% =============================================================


end

