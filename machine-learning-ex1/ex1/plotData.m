function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

figure; % open a new figure window

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the training data into a figure using the 
%               "figure" and "plot" commands. Set the axes labels using
%               the "xlabel" and "ylabel" commands. Assume the 
%               population and revenue data have been passed in
%               as the x and y arguments of this function.
%
% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);

% Debabrata Comments - Coding Start
% Asked to plot training data with red markers. 
% and set x and y axis labels
plot(x, y,'rx','MarkerSize', 10);%Plotthedata
ylabel('Profitin$10,000s');%Settheyaxislabel
xlabel('PopulationofCityin10,000s');%Setthexaxislabel
% Debabrata Comments - Coding End


% ============================================================

end
