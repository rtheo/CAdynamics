function kertest(L)
k0 = kerinit(L);   % initialize kernel sub-vectors
j = 1; kk = [];
for i=1:L^2
    [k, j] = kernel( k0, i, j ) ;
    kk = [kk; k];
end
imagesc(kk)
end