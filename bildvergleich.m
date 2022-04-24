function [del1,del2,del3,del4,del5, uniformity] = bildvergleich(R,A)
%BILDVERGLEICH Summary of this function goes here
%   Detailed explanation goes here

% 4.2
del1 = (1/ (size(A,1)*size(A,2))) * sum(sum(abs(R-A)));

% 4.3
del2 = sqrt((1/ (size(A,1)*size(A,2))) * sum(sum((R-A).^2)));

%4.4
del3 = sum(sum((A-R).^2)) / sum(sum((A+R).^2));

%4.8
del4 = sum(sum((A-R).^2)) / sum(sum((A-(mean(A,"all"))).^2));

%4.9
del5 = sum(sum(abs(A-R))) / sum(sum(abs(A)));

%4.11
uniformity = 1 - 1/2 *(sum(sum(abs(A-mean(A,'all'))))/sum(sum(abs(A))));
end