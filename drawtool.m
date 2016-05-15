function P = drawtool(initmode, dim, fname)
% initmode: 1 for random array, 2 for graphic initerface,  3 for external
% image file (fname)
% dim:= dimension of square array 
if nargin<3, 
    fname = ' '; if initmode==3, error('Filename missing in mode 3!'), end 
end
if initmode<1 || initmode> 3, error('Arg1 out of range: choose 1, 2, or 3'), end
clf, close all
h1=figure(1); grid on
P = zeros(dim,dim);
imagesc(1 - P); colormap gray
title(' Graphic Initialization Mode (reverse colormap). Press any key to exit')
xlabel('Left Mouse Button to pick points/ Right to exit')
switch initmode
    case 1, P = round(rand(dim,dim));
    case 2,
        click = 1;
        while click <= 3
            [x,y, click] = ginput(1);
            if click==1, P(floor(y),floor(x)) = 1; end
            if click==3, P(floor(y),floor(x)) = 0; end
            imagesc(1 - P); grid, colormap gray 
            title(' Graphic Initialization Mode (reverse colormap).Press any key to exit')
            xlabel('Left Mouse Button to mark points/ Right to erase')
        end
        close(h1)
    case 3,
            Im = imread(fname); 
            if isrgb(Im), P = mod( imadjust( rgb2gray(Im) ), 2); end
            [xdim, ydim] = size(P);
            if nx~=dim && nx~=dim 
                disp(['Image dimensions: ',num2str(nx),' x ',num2str(ny)])  
                disp('Adjusting dimension to minimum')
                dim = min(xdim, ydim);    
                if xdim<ydim, P = P(1:dim, :); else P = P(:, 1:dim); end
end
end