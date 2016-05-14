function [R, s1, s2 ] = liferule
s1 = 0; % create digit-sum sequence for all 9-bit strings in lexicographic order
% left half-interval (central cell dead.)
for i=1:8
    s1 = [s1, s1+1];
end
half = 2^8;
 s = [s1, s1+1];s2 = s(half+1:end); % right half-interval (central cell alive.)
 % define output values for living central cells in the two half-intervals
R = [(s1==3), (s2 == 3) + (s2 == 4)]; 
end