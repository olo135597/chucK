Noise waveOsc => LPF waveFilter => dac;



fun void waves () {

Math.random2f(0.01, 0.05) => float wave;
wave::second => dur beat;



0.5 => waveOsc.gain;


 Math.random2(0, 15) => int q;
q => waveFilter.Q;

 Math.random2(200, 700) => int range;

for (0 => int i; i < range; i++) {
    i => waveFilter.freq;
    beat => now;  

}
for (range => int i; i > 1; i--) {
   
    i  => waveFilter.freq;
   
    beat => now;
}
}

while (true) {
    waves();
    
}


