TriOsc melody => ADSR env1 => dac;
TriOsc bass => ADSR env2 => dac;
env3 => Delay del1 => dac;
del1 => del1;
1::second => dur beat;
(beat / 2, beat / 2, 0, 1::ms) => env1.set;
(1::ms, beat /8, 0, 4::ms) => env2.set;
25 => int offset;
int position;

beat => del1.max; 
beat / 4 => del1.delay;
0.6 => del1.gain;


0.2 => melody.gain;
0.1 => bass.gain;

fun void melody () 
{
    
}

fun void oneTakt( int oneNote, int twoNote, int threeNote, int fourNote)
{
  for (int i = 0; i < 4; i++)
  {
     
  }
}

