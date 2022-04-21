N = 100;
theta = 0:1:359;
p = round(sqrt(2)*N);
R = 2;
d = 2*atand(1/(2*R-1));
isDisp = 0;

% Hier kann ein beliebiger Absorptionskoeffizient erstellt werden
% zBsp: Beispielbilder einfügen, Matlab Phantom Funktion, ...
absCoeff = phantomgallery('smooth',N,4);

[A, b, x, theta, d, p] = fanbeamtomo(N,theta,p,R,d,isDisp, absCoeff);

% Ergebnisanzeige
disp('A:')
disp(A)

disp('b:')
disp(b)

% Benutzen Sie die Funktion kaczmarz.m um das Gleichungssystem 
% F.1 mittels des Kazcmarz Algorithmus für das Beispiel zu lösen
K = 20;

[X,info] = kaczmarz(A,b,K);

figure
imagesc(reshape(X,N,N)), colormap gray,
axis image off
title('Kaczmarz reconstruction')

% test params
[del1,del2,del3,del4,del5, uniformity] = bildvergleich(x,X);
disp('del1: ');
disp(del1);
disp('del2: ');
disp(del2);
disp('del3: ');
disp(del3);
disp('del4: ');
disp(del4);
disp('del5: ');
disp(del5);
disp('uniformity: ');
disp(uniformity);

figure
imagesc(reshape(x,N,N)), colormap gray,
axis image off
title('Original')

l = abs(X-x);

figure
imagesc(reshape(l,N,N)), colormap gray,
axis image off
title('Diff')