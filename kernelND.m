function knd = kernelND( L, dim, pc, plt )
% Generic Kernel constructor for higher dimensions via tensor products
% L := square lattice length, dim := CA dimension
% pc := permutation flag, plt {0, 1, 2} for no plot/ kernel plot/ log plot
if nargin<4, plt = 0; end
if nargin<3, pc = 0; end
clc, close all
ck = [2.^(0:2) zeros(1, L-3)];
ck = circshift( ck', [ -1 0 ] )';
knd = toeplitz(  [ck(1), fliplr(ck(2:end))],  ck  );
%disp(knd)
for i=1:dim-1
    if pc && dim==2
        [w1, w2] = perm( L, i );
        knd = kron( w1, knd ) + kron( 8*eye(L), w2 );       
    else
        % Permutation breaks block symmetry. Replace with sum-of-krons
        w = noperm( L, i ); knd = kron( w, knd );
    end
end
%disp(knd), pause
if plt > 0
     figure(1)
     if plt, imagesc(knd) 
     else
         imagesc( log2( knd+ 0.5 ) ) 
     end
title('Interaction Kernel')
[D, E] = eig( knd ); 
figure(2), plot( E, '.')
title('Eignevalue Spectrum')
figure(3), imagesc(real(D))
title('Eigenvector matrix (Real Part)')
figure(4), imagesc(real(D))
title('Eigenvector matrix (Imag. Part)')
end
end

function w = noperm( L, i )
seq = 2.^(3*i*(0:2));
ck = [seq zeros(1, L-3)];
ck = circshift( ck', [ -1 0 ] )';
w = toeplitz(  [ck(1), fliplr(ck(2:end))],  ck  );
end

function [w1 w2] = perm( L, i )
c1 = [ 0 32 zeros(1,L-3) 1]; 
c2 = [32 2 zeros(1, L-3) 1];
w1 = toeplitz(  [c1(1), fliplr(c1(2:end))],  c1  );
w2 = toeplitz(  [c2(1), fliplr(c2(2:end))],  c2  );
end