function kernel(L, plt)
if nargin<2, plt=0; end
k0 = kerinit(L);   % initialize kernel sub-vectors
j = 1; kk = [];
for i=1:L^2
    [k, j] = kervec( k0, i, j ) ;
    kk = [kk; k];
end
if plt
figure(1), imagesc(kk)
title('Interaction Kernel')
[D, E] = eig( kk ); x = 1:L^2;
figure(2), plot( E, '.')
title('Eignevalue Spectrum')
figure(3), imagesc(real(D))
title('Eigenvector matrix (Real Part)')
figure(4), imagesc(real(D))
title('Eigenvector matrix (Imag. Part)')
end
end

function [ker, j] = kervec( k0, i, j)
[dummy, L] = size(k0);
count = mod(i, L);
k0 = circshift(k0', count - 1 )';  
if j==1, 
    ker = [ k0(2,:), k0(3,:), zeros(1, L*(L-3)), k0(1,:) ]; %disp(ker)
end
if (j>1) && (j <= L-1), 
    L1 = (j-2)*L; L2 = L*(L-3) - L1; %disp([i j L1 L2])
    ker = [ zeros(1, L1), k0(1,:), k0(2,:), k0(3,:), zeros(1, L2) ]; 
end
if j == L, 
    ker = [ k0(3,:) , zeros(1, L*(L-3)), k0(1,:), k0(2,:) ]; 
end
j = j + (count == 0);
end

function k0 = kerinit(L)
ker1 = zeros(1,L);  ker1(1:3) = 2.^(0:2);
ker2 = zeros(1, L); ker2(1:3) = [8 256 16]; 
ker3 = 32*ker1;
k0 = [ker1; ker2; ker3];
k0 = circshift(k0', -1)';
end
