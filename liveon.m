function liveon(v, time, graf)
clc, close all
L = sqrt( length(v) );
if mod(L, 1)>0, error('In. Cond. length not a square number!'), end
r = liferule;        % initialize Life transfer function
%r = thuemorse; r = ~r;
k0 = kerinit(L);   % initialize kernel sub-vectors
h = zeros(1, L^2);
imagesc( reshape(1-v, L, L) ), colormap gray, pause
for t=1:time
    % evolve via bi-circular convolution
    j = 1;
    for i=1:length(v)
        [k, j] = kernel( k0, i, j ) ;
        h(i) = k*v' ;   
    end 
    v = r(h + 1);
    if sum(v) == 0, disp(['All cells dead at t = ',num2str(t)]), break, end
    if strcmp(graf, 'L'), imagesc( reshape(1-v, L, L) ), colormap gray, pause(0.1), end
    if strcmp(graf, 'h'), imagesc( reshape(h, L, L) ), pause(0.1), end
    if strcmp(graf, 'hft'), psh = abs( fft(h) ); surf( fftshift( reshape( psh, L, L) ) ), pause(0.1), end
    if strcmp(graf, 'Lft'), psv = abs( fft(v) ); surf( fftshift( reshape( psv, L, L) ) ), pause(0.1),  end
end
end