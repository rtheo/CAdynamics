function int2array = FDFBD( n, bitlen )
% Fast Division Free Binary Decoder
% Equivalent formula: ceil( mod( log2( bitxor( n, n+2.^(0:7) ) ), 1) )
if nargin < 2, bitlen = floor( log2(n) )+1; end
n =  bitxor( n, n + 2.^( 0:bitlen-1 ) ); 
int2array = ~bitand( n, n-1 );
int2array = ~int2array;
end