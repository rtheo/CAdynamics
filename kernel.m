function kernel(L, plt)
if nargin<2, plt=0; end
k0 = kerinit(L);   % initialize kernel sub-vectors
j = 1; kk = [];
for i=1:L^2
    [k, j] = kernel( k0, i, j ) ;
    kk = [kk; k];
end
if plt
figure(1), imagesc(kk)
title('Interaction Kernel')
[D, E] = eig( kk ); x = 1:L^2;
figure(2), plot(x, real(E), x, imag(E))
title('Eignevalue Spectrum')
figure(3), imagesc(real(D))
title('Eigenvector matrix (Real Part)')
figure(4), imagesc(real(D))
title('Eigenvector matrix (Imag. Part)')
end
end
