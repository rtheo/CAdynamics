function liveon(v, time, graf)
% Example with direct application of matrix convolution
% try it with teh simplest blinker oscillator 
% c = [zeros(1,6), 1 1 1, zeros(1, 16)]; 
clc, close all
L = sqrt( length(v) );
if mod(L, 1)>0, error('In. Cond. length not a square number!'), end
r = liferule;        % initialize Life transfer function
k0 = kerinit(L);   % initialize kernel sub-vectors
ptr = zeros(1, L^2);
imagesc( reshape(1-c, L, L) ), pause, colormap gray
for t=1:steps
    % evolve via BCCB convolution
    j = 1;
    for i=1:length(c)
        [k, j] = kernel( k0, i, j ) ;
        ptr(i) = k*c' ;   
    end 
    c = r( ptr + 1 );
    if sum(c) == 0, disp(['All cells dead at t = ',num2str(t)]), break, end
    if strcmp(graph, 'L'), imagesc( reshape(1-c, L, L) ), colormap gray, pause(0.1), end
    if strcmp(graph, 'h'), imagesc( reshape(ptr, L, L) ), pause(0.1), end
    if strcmp(graph, 'hft'), psh = abs( fft(ptr) ); imagesc( fftshift( reshape( psh, L, L) ) ), pause(0.1), end
    if strcmp(graph, 'Lft'), psv = abs( fft(c) ); imagesc( fftshift( reshape( psv, L, L) ) ), pause(0.1),  end
end
end
