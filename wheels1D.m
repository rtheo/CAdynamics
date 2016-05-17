function wheels1D( q0, rule, steps )
% Permutation Machine implementation - enlarged isentropic code. 
% all instances encoded with const. entropy (log2) words only using
% 0 -> (0, 1),  1 -> (1, 0)
r = ceil(mod(log2(bitxor(rule, rule+2.^(0:7))), 1)); % division-free binary decoder 
% Rencoding initial condition in double its length
% Setup "Zero" condition and permute bits in all one positions
q = zeros(1,2*length(q0)); q(1:2:end) = 1;
idx = 2*find( q0==1 )-1; q(idx) = 0; q(idx+1) = 1; 
% eigenvalues for circulant filter
ql = length(q); v = zeros(1,ql); 
v(1:2:6) = 2.^(0:2); v = circshift(v', -2)' ;
u = fft( v ); qmat = []; 
for i=1:steps    
    p = round( abs( ifft( u.*fft( q ) ) ) );
    q(1:2:end) = r( p(1:2:end)+1 );
    q(2:2:end) = 1 - q(1:2:end);
    qmat = [qmat; q]; 
end
imagesc(qmat), colormap gray
end