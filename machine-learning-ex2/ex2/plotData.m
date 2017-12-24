function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
% Debabrata Comments - Coding Start
% Get all positive values, get all neg values. Then plot pos as + and neg as o. Different color.
% see the color is red and yellow.

    pos = find(y==1);
    neg = find(y==0);
    %PlotExamples
    plot(X(pos, 1), X(pos, 2),'k+','LineWidth', 2,'MarkerSize', 7);
    plot(X(neg, 1), X(neg, 2),'ko','MarkerFaceColor','y','MarkerSize', 7);
% Debabrata Comments - Coding End
% 
% =========================================================================



hold off;

end
