function R  = liferule  %Problem with this rule -- to be chekced! --
s = 0; % create digit-sum sequence for all 9-bit strings in lexicographic order
for i=1:9
    s = [s, s+1];
end
% Use ternary encoding for additive rule using transitions only 
% 1st half: 0 -> 1, 2nd half: 1 -> 0
half = 2^8; 
R = [ (s(1:half)==4), - (s(half+1:end)==2) - (s(half+1:end)>4) ];
end
