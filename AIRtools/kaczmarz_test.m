numIterations = 20; 
xStart = [20;20];
b = [1.5;1;1;1];
A = [[-1,1];[-0.5,1];[0,1];[1,1]];

x = kaczmarz(A, b, numIterations, xStart);
disp(x);