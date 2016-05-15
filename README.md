# CAdynamics
Alternative representation of Cellular Automata with Circulant Convolution Filters

Main Program   
liveon.m   : Simulates a 2D CA with a particular rule loaded at initialization level <br>
liferule.m : Initializes Game-of-Life Rule in equivalent 1D Lookup Table form<br> 
kerinit.m  : Initializes Kernel vector<br>
kernel.m   : Implements rotations of the kernel vector for a 2D lattice<br>
Auxilliary<br>
kertest.m : Shows an image of the Interaction Kernal as a matrix<br>
gmap.m    : Computes a global map of a 2D CA for all input strings of a given length<br>

Use mat = drawtool(init, dim,...) to make initial conditions as square arrays in three modes<br>
1 -> random square array<br>
2 -> graphical user interface using mouse to mark ones/zeros<br>
3 -> load from external image file<br>

Use v = reshape(mat, 1, dim*dim) to feed the liveon(v, ...) function 

Change liferule with your own function for other CA types.
