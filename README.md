# CAdynamics
Alternative representation of Cellular Automata with Circulant Convolution Filters

1D cases<br>
spectral1D.m : A split-step method from the spectral decomposition of circulant filters<br>
Wheels1D.m   : Example of an alternative isentropic encoding for the study of analog machines w/out waste heat<br> 

2D cases (Game-of-Life)<br>   
liveon.m     : Simulates a 2D CA with a particular rule loaded at initialization level <br>
liferule.m   : Initializes Game-of-Life Rule in equivalent 1D Lookup Table form<br> 
kerinit.m    : Initializes Kernel vector<br>
kernel.m     : Implements rotations of the kernel vector for a 2D lattice<br>
kertest.m    : Shows an image of the Interaction Kernal as a matrix<br>
gmap.m       : Computes a global map of a 2D CA for all input strings of a given length<br>

Auxilliary<br>
drawtool.m
musarithmica.m

Use mat = drawtool(init, dim,...) to make initial conditions as square arrays in three modes<br>
1 -> random square array<br>
2 -> graphical user interface using mouse to mark ones/zeros<br>
3 -> load from external image file<br>

Use v = reshape(mat, 1, dim*dim) to feed the liveon(v, ...) function 

Change liferule.m with your own function for other CA types.

The 'musarithmica' code for the complete transcription of any automaton in to a musical score is forthcoming<BR>
Motivation behind this project is explained in the technical section.<br>

Technical Comments<br>
Details on the spectral representation of circulant filters are in the relevant Wikipedia's lemma<br>
https://en.wikipedia.org/wiki/Circulant_matrix<br>

Details on pseudo-spectral methods are in the below link<br>
https://en.wikipedia.org/wiki/Split-step_method<br>

The peculiar analogy in the spectral1D code with the split-step method can be made exact by taking the<br> 
analysis of the eigenvalues from the first link and considering a superposition of "wavefunctions" with <br>
the non-linear part being given as the solution of http://mathurl.com/jzq7sxy.png or http://mathurl.com/hhco7xm.png<br>
with W the Lambert's function. Whether this is just a coincidence may be a matter of interpretation.

The "wheels" trick explained in the comments uses the same filter technique on a different encoding.<br>
An example of wheels1D(round(rand(1,100)), 110, 100) is shown in 110rand using the Turing complete 110 rule<br>
<p align="center">
  <img src="https://github.com/rtheo/CAdynamics/blob/master/110rand.jpg" width="350"/>
</p>

<b>MUSARITHMICA: The Sound of Universal Computation</b>
The title of the code is a tribute to the great master <a href="https://en.wikipedia.org/wiki/Athanasius_Kircher">Athanasius Kircher</a> who in a sense preceded Babbage to a limited extend with his <a href="https://en.wikipedia.org/wiki/Arca_Musarithmica">Arca Musarithmica</a>
