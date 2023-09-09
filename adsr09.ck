TriOsc osc => ADSR env1 => dac;


TriOsc osc2 => ADSR env2 => dac;
SinOsc osc3 => ADSR env3 => dac;
env3 => Delay del1 => dac;
del1 => del1;
1::second => dur beat;
(beat / 2, beat / 2, 0, 1::ms) => env1.set;
(1::ms, beat /8, 0, 4::ms) => env2.set;
(1::ms, beat /8, 0, 100::ms) => env3.set;
25 => int offset;
int position;

beat => del1.max; 
beat / 8 => del1.delay;
0.6 => del1.gain;


0.2 => osc.gain;
0.1 => osc2.gain;
0.5 => osc3.gain;

[0,4,2,12] @=> int major[];
[0,3,7,12] @=> int minor[];

fun void partByTwo(int position, int chord[])
{
    
for(0 => int i; i < 2; i++)
{
  Std.mtof(chord[0] + offset + position) => osc.freq;
  1 => env1.keyOn;
  for(0 => int x; x < 4; x++)
  {
    Std.mtof(chord[x] + offset + position + 12) => osc3.freq;
    1=> env3.keyOn;
    

  for(0 => int j; j < 4; j++)
  {
    Std.mtof(chord[j] + offset + position + 12) => osc2.freq;
    1 => env2.keyOn;
    beat / 8 => now;
  }
  }
}
}


0 => int counter;
while(counter < 4)
{
  counter++;
  partByTwo(24, major);
  partByTwo(31, major);
  partByTwo(21, minor);
  partByTwo(29, major);

//.-------------------------------------------------------------//
}

