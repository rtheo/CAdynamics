function spectral1D( q, rule, steps )
% q := externally produced binary cell array, 
% rule: = byte as integer, steps:= total evolution time
% Symmetric neighborhoods only. Change line 7 otherwise
clc, close all
dim = length(q);
r = ceil(mod(log2(bitxor(rule, rule+2.^(0:7))), 1)); % division-free binary decoder 
rad = 1; N = 2*rad+1; base = 2.^(0:N-1); 
v = [base, zeros(1, dim-N)]; v = circshift(v', -1)' ;
u = fft( v ); % extract eigenvalues for circ filter
% pseudo-spectral method analogous to nonlinear Schroedinger 
% ( https://en.wikipedia.org/wiki/Split-step_method )
qmat = []; 
for i=1:steps    
    p = ifft( u.*fft( q ) );
    q = r( round(q)+1 ); 
    qmat = [qmat; q];
end
imagesc(qmat), colormap gray
end