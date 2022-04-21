R = [[1,2,3];[1,2,3]];
A = [[1,2,3];[1,2,4]];
[del1,del2,del3,del4,del5, uniformity] = bildvergleich(R,A);

meanval = mean(A,'all');
disp(meanval)