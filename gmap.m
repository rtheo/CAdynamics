function z = gmap(L)
clc, close all 
dim = 2^L; Lsqrt = 2^(L-1);
words = fliplr( ff2n(L) ); % binary strings powerset constructor
r = liferule;
k = kernel(Lsqrt); 
hmat = []; lmat = [];
base = 2.^(0:L-1);
for k=1:dim
    s = words(k, :); 
    h = k*s' ;
    lr = s + r(h+1);
    hmat = [hmat, h'];
    lmat = [lmat, lr' ]; 
end
z = base*lmat;
analyze(z)
figure(1), imagesc(hmat), title(['Circular Convolution over all strings in [0,...,',num2str(dim),']'])
figure(2), imagesc(lmat), title('Life Rule filter'), colormap gray
figure(3), plot(z,'*')
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
figure(4), plot(dz,'*')
end
