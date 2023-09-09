SinOsc osc => ADSR env1 => Pan2 pan => dac;

1 => pan.pan;
//env1 => Delay delay[2];

11::second =>  dur beat;
/*delay[0] => dac.left;
delay[1] => dac.right;
beat => delay[0].max => delay[1].max;
0.5 => delay[0].gain => delay[1].gain;
delay[0] => delay[0];
delay[1] => delay[1];
beat / 4 => delay[0].delay;
beat / 2 => delay[1].delay;*/




(100::ms, beat /2, 0, 1::ms) => env1.set;
0.25 => osc.gain;

[0,4,7] @=> int major[];
[0,3,7] @=> int minor[];

60 => int offset;
int position; 



while (true) {
for(0 => int i; i < 4; i++) {
    for(-1.0 => float j; j < 1.0; 0.1 +=> j)
    {
        beat / Math.random2(2,16) => env1.decayTime;
        Math.random2(1,4) * 12 => position;
        Math.random2f(-1.0,4.0) => float panValue;
        Math.random2(0, major.cap() -1) => int note;
        panValue => pan.pan;
        <<< "pan:", panValue >>>;
        Std.mtof(major[note] + offset + position) => osc.freq;
        1 => env1.keyOn;
        beat / 4 => now;
    }
}

for(0 => int i; i < 4; i++) {
    for(-1.0 => float j; j < 1.0; 0.1 +=> j)
    {
        beat / Math.random2(2,16) => env1.decayTime;
        Math.random2(1,4) * 12 => position;
        Math.random2f(-1.0,4.0) => float panValue;
        Math.random2(0, minor.cap() -1) => int note;
        panValue => pan.pan;
        <<< "pan:", panValue >>>;
        Std.mtof(minor[note] + offset + position) => osc.freq;
        1 => env1.keyOn;
        beat / 4 => now;
    }
}
}