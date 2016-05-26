function liveon( c, steps, graph )
% Example with direct application of matrix convolution
% Try it with liveon( [], ... )
clc, close all
if isempty(c), 
    disp(' Trial Patterns \n');
    disp('(1) 2-period blinker')
    disp('(2) 5-period octagon')
    disp('(3) R-Pentomino "Methuselah" ')
    in=input('Enter your choice: \n');
    switch in
        case 1, c = [zeros(1, 11), 1 1 1, zeros(1, 11)];
        case 2, w = zeros(4); for i=1:4, w( i, 4 - i + 1) = 1; end
                    c = [ w, fliplr( w ) ]; c = [ c; flipud( c ) ]; 
                    c = zeros(10); c(2:9, 2:9) = cp; c = reshape(c, 1, 100);
        case 3, c = [zeros(1, 11), 1 1 1, zeros(1, 11)]; c(8) = 1; c(19) = 1;
    end
end
L = sqrt( length( c ) );
if mod(L, 1)>0, error('Init. Cond. length not a square number!'), end
r = liferule;        % initialize Life transfer function
k = kernel(L);       % initialize convolution kernel
ptr = zeros(1, L^2);
imagesc( reshape(1-c, L, L) ), pause, colormap gray
title('Press any key to continue')
% evolve via BCCB convolution
for t=1:steps    
     ptr = k*c'; cnew = c + r( 1 + ptr );  % discretized pde representation
    if sum(c) == 0, disp(['All cells dead at t = ',num2str(t)]), break, end
    if strcmp(graph, 'L'), imagesc( reshape(1-c, L, L) ), colormap gray, end
    if strcmp(graph, 'h'), imagesc( reshape(ptr, L, L) ), end
    if strcmp(graph, 'hft'), psh = abs( fft(ptr) ); imagesc( fftshift( reshape( psh, L, L) ) ), end
    if strcmp(graph, 'Lft'), psv = abs( fft(c) ); imagesc( fftshift( reshape( psv, L, L) ) ), end
    if cnew == c, 
        title(['Fixed Point at ',num2str(t) ]), break;
    else
        title(['Step = ',num2str(t) ]), pause(0.1)
    end
    c = cnew;
end
end
