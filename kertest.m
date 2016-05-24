function kertest(L)
k0 = kerinit(L);   % initialize kernel sub-vectors
j = 1; kk = [];
for i=1:L^2
    [k, j] = kernel( k0, i, j ) ;
    kk = [kk; k];
end
figure(1), imagesc(kk)
title('Interaction Kernel')
[D, L] = eig( kk );
figure(2), plot(L)
title('Eignevalue Spectrum')
figure(3), imagesc(real(D))
title('Eigenvector matrix (Real Part)')
figure(4), imagesc(real(D))
title('Eigenvector matrix (Imag. Part)')
end
