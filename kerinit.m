function k0 = kerinit(L)
ker1 = zeros(1,L);  ker1(1:3) = 2.^(0:2);
ker2 = zeros(1, L); ker2(1:3) = [8 256 16]; 
ker3 = 32*ker1;
k0 = [ker1; ker2; ker3];
k0 = circshift(k0', -1)';
end