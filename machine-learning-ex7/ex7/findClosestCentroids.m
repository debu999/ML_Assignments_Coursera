function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);
% size(X) (300,2) 
% size(centroids) (3,2)

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
    % Debabrata Comments - Coding Start
    %
    % =============================================================
    % Initialize dist_mat to 0*0 matrix
    dist_mat=[];
    % For each Centroid i.e. 1 to K centroid, get the populate the distance 
    % matrix with appt distance
    for centroididx = 1:K
      dist_mat=cat(2,dist_mat,sum(bsxfun(@minus,X,centroids(centroididx,:)).^2,2));
    end
    % Get the index which is minimum for the distance i.e. closest centroid.
    [_,idx]=min(dist_mat,[],2);
    % Debabrata Comments - Coding End
    %
    % =============================================================

% =============================================================

end

