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
