SawOsc bassOsc=> ADSR envBass => Delay delBass => LPF bassFilter => NRev rev1 => Pan2 pan  => dac;


1000 => bassFilter.freq;
0.2 => rev1.mix;
fun void bass () {
        1::second => dur bassBeat;

        [0,4,7] @=> int major[];
        [0,3,7] @=> int minor[];



    (100::ms, bassBeat /2, 0, 10::ms) => envBass.set;
    bassBeat => delBass.max; 
bassBeat / 8 => delBass.delay;
0.6 => delBass.gain;
    0.5 => bassOsc.gain;
    3 => int offset;
    int position;

    for(0 => int i; i < 4; i++) {
    for(-1.0 => float j; j < 1.0; 0.1 +=> j)
    {
        bassBeat / Math.random2(2,16) => envBass.decayTime;
        Math.random2(1,4) * 12 => position;
        Math.random2f(-1.0,4.0) => float panValue;
        Math.random2(0, minor.cap() -1) => int note;
        panValue => pan.pan;

        Std.mtof(minor[note] + offset + position) => bassOsc.freq;
        1 => envBass.keyOn;
        bassBeat / Math.random2(1, 4) => now;
    }
}
    
    
}

bass();
