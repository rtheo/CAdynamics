function s = IPFBAA(s, n)
% Inf. Prec. Fast Binary Adder Automaton replaces binary counter model
% Complexity varies with Leading Zero and Digit-Sum
if isempty( s ) || all(s), s = zeros( 1, n ); return, end % recycling
if s(1), % mod 2
    for i=1:n, s(i) = 0; if ~s(i+1); s(i+1) = 1; break; end, end
else
    s(1) = 1;
end
end