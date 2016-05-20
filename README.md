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
drawtool.m<br>
musarithmica.m<br>

Use mat = drawtool(init, dim,...) to make initial conditions as square arrays in three modes<br>
1 -> random square array<br>
2 -> graphical user interface using mouse to mark ones/zeros<br>
3 -> load from external image file<br>

Use v = reshape(mat, 1, dim*dim) to feed the liveon(v, ...) function 

Change liferule.m with your own function for other CA types.

The 'musarithmica' code for the complete transcription of any automaton in to a musical score is forthcoming<BR>
Motivation behind this project is explained in the technical section.<br>

<b>Technical Notes</b>

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

<b>MUSARITHMICA: The Sound of Universal Computation</b><br>

The title of the code is a tribute to the great master <a href="https://en.wikipedia.org/wiki/Athanasius_Kircher">Athanasius Kircher</a> who in a sense preceded Babbage to a limited extend<br> 
with his <a href="https://en.wikipedia.org/wiki/Arca_Musarithmica">Arca Musarithmica</a> algorithm<br>.

The purpose here is exactly the opposite and it is about a proof-of-concept on the existence of a mapping of the set<br> 
of all computations into a subset of harmonic analysis. This requires recognizing three principles:<br>

A. The existence of constant maximal entropic encodings in a Fourier domain signifies a deviation from ordinary Shannon<br> channels where capacity is no more tied up solely to the S/N ratio (SNR becomes a freely adjustable parameter apart from <br>
the exact message encoded). The essence of this can be understood with analogical thinking by stating that the bits are to<br>
the integers as the frequencies are to a time domain signal and by the same token, as eigenstates are to a cavity or an<br> abstract system on a Hilbert space.

B. <it><b>Pluribus Unum Principle:</it></b>The application of spectral methods via a transcription of the "Wheels" technique directly into the<br> 
spectrum of a unique signal allows to make any such model parallel computation into an analog model corresponding to a<br> particular dynamical system acting on a single signal.<br>

C. If an equitempered harmonic scale is to be used for tuning such a machine then a single signal and its transformations <br>
over time could be made audible in an appropriate bandwidth up to say, 20 kHz running aross all octaves. Coexistence<br>
(superposition) of a multiplicity of states from an alphabet in one and the same signal (<it>"Pluribus Unum"</it> Principle) allows<br> 
in the case of a harmonic encoding a direct mapping into the recently found theory of
<a href="https://en.wikipedia.org/wiki/Orbifold#Music_theory">Musical Orbifolds</a>. Hence in a sense<br>
orbifolds can also be considered as equivalent models for analog universal computation in a harmonic encoding.

Construction of such a machine or its emulator can take advantage of both 
<a href="https://en.wikipedia.org/wiki/Additive_synthesis">Additive</a> as well as 
<a href="https://en.wikipedia.org/wiki/Additive_synthesis#Inverse_FFT_synthesis">IFFT</a> Synthesis techniques<br>
One can take advantage of the fact that a circulant operator admits also a representation as a set of irreducible<br>
cyclic generators. For a symmetric neighborhood this amounts to only three such matrices. One can then use a basic<br>
encoding of a Fourier series starting from a fundamental with an appropriate inter-frequency span and then take two<br>
such more to form signals standing for cyclic permutations plus/minus one position from the original one. Taking the<br>
ifft of the summand of these three signals will result into the same address field as in the "digital" code "Wheels1D.m"

All technical details given here are not by any means restricted to the audible spectrum which is solely used as a means of<br>
of demonstration. As a matter of fact, any abstract system having a Hilbert Space could be used givenb the existence of some<br> method of selectively picking up any subset of such states at each iteration step.

Performing a musical encoding requires a slight alteration in the inter-frequency spacing. One just starts from the lowest<br>
octave considering a superposition like a sequence of notes ABCDEFGABCDEFG... acorss increasing frequency octaves<br> 
played all together like a chord. All spectral coefficients are taken equal and cosntant. Then one separates even and odd<br> positions where presence of an odd note representes the presence of a bit and presence of an even one the absence of a bit.<br>
A binary word like "100110" can then be encoded as "ADFGBE". Only disadvantage in this case is the low capacity of the<br>
resulting musical register in the audible spectrum. A similar variant could be given with the aid of the ancient 
<a href="https://en.wikipedia.org/wiki/Pythagorean_tuning">Pythagorian</a> scale.

The above guranatees isospectral computation. If you also want to guarantee the isentropic character in the ordinary sense<br>
used by information engineers one can also separate odd and even spectral coefficients so as to have the later been half <br>
 of the first or the reverse and spread around half of the interfrequency intervals with some Gaussian fit. Then any histogram<br> used to compute standard Shannon's entropy would be balanced around log(2) just as in the original "digital" version<br> of the 'spectral1D' code.
 
 It should be noted that there is a much more compact method of isospectral encoding for a powerset of 2^N bit-strings<br>
 Given a bit-block counter, each and every word is analyzed into its constituent alternating bolcks of zeros and ones.<br>
 For instance, "11010100" -> [2, -1, 1, -1, 1, -2]. As this is always an alternating sequence it can be turned into its<br>
 "monic" form by extracting a sign bit in front as 0/1. Normalizing the above with the sum-of-squares and taking them as<br>
 spectral coefficients allows writing  lesser frequencies in a harmonic interval at the same time guaranteeing the isospectral<br> character of the encoding. This method though is difficult to emulate for the rule application and is not<br>
 followed here.

Building a particular (continuous) dynamical system able to apply the particular "program" given as the harmonic encoding<br>
of the original CA rule is a different engineering problem and could be dealt in a variety of ways using eg. vector coding <br>
and generic Neural Network techniques. For building an emulator is enough to take all appropriate frequency shifts via a single<br> loop although this is neither optimal nor the speediest implementation possible. It suffices though to give the<br>
listener a feeling of how does a Turing complete rule like "110" sounds like. It also means that for small cell arrays fitting<br> into an audible spectrum via an equitempered harmonic tuning, one could really use an orchestra/choir to actually<br> perform the computation!
