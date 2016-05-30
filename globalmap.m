function z = globalmap(N)
% Construct global maps for 2D CA over a sequence of N x N square lattices 
% Memory limits may force separate plots of sub-intervals of z array.
% subint defines limits on exponents for subintervals of the total powerset.
% eg, globalmap( 5, 4, 2) scans over [ 2^16 ... (2^17)-1 ] with inter starting from 0.
% globalmap( n ) := globalmap( n, 0, 0) whole powerset scan
% Reminder: NP procedure. Slow down/memory limit problems for  L > 5. 
% To avoid binary counters of linear complexity we use a Successor function 
%(IPFBAA) as a bit-string generator inside the main loop.
if nargin<2, subint=0; inter = 0; end
clc, close all 
L =N^2; r = liferule; k = kernel( N ); 
if subint==0, %Initialize bit-string generator
    s = IPFBAA( [], L ); lowlim = 1; uplim = 2^L; 
else
    dim1 = subint^2 + inter; s = ones(1, L); 
    lowlim = 2^dim1; uplim = 2*lowlim - 1;
end
base = 2.^(0:L-1); 
for i=lowlim:uplim
    s = IPFBAA( s, L); 
    out = s + r( 1 + k*s' );
    z(i) = base*out'; 
end
figure(1), plot(z,'.')
analyze(z, 2^L-1)
end

function analyze(z, d)
v = unique(z); lu = length(v);
sum0 = sum(z==0); sumup = sum(z==511);
disp(['Number of unique values: ',num2str(lu)])
disp(['Zero values: ',num2str(sum0)])
disp(['Upper limit values: ',num2str(sumup)])
disp(['Non-zero values: ',num2str(length(z) - sum0 - sumup)])
dz = z - (1:length(z));
figure(2), plot(dz,'.'), title('deviation from linearity')
disp(['Fixed points: ',num2str(sum(dz==0))])
end
