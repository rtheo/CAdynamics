function z = gmap(N)
% Construct global maps for 2D CA over a sequence of N x N square lattices 
% Reminder: NP procedure!
% For large number L>4 the ff2n routine should be replaced with a sequential
% bit-string generator inside the main loop
clc, close all 
L =N^2; dim = 2^L; 
words = fliplr( ff2n( L ) ); % binary strings powerset constructor
r = liferule; k = kernel( N ); 
hmat = []; lmat = []; 
base = 2.^(0:L-1);
for i=1:dim-1
    s = words(i, :); 
    out = s + r( 1 + k*s' );
    z(i) = base*out'; 
end
figure(1), plot(z,'*')
analyze(z)
end

function analyze(z)
v = unique(z); lu = length(v);
sum0 = sum(z==0); sumup = sum(z==511);
disp(['Number of unique values: ',num2str(lu)])
disp(['Zero values: ',num2str(sum0)])
disp(['Upper limit values: ',num2str(sumup)])
disp(['Non-zero values: ',num2str(length(z) - sum0 - sumup)])
% strip all non-extreme values - check for fix. points
zsum = 0;k = 0;
for i=1:length(z)
    if z(i)==i, zsum = zsum + 1; end
    if z(i)>0 && z(i)<511, k=k+1;dz(k) = z(i)-i;end
end
disp(['Fixed points: ',num2str(zsum)])
figure(2), plot(dz,'*')
end
