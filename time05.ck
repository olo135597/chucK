1::second /2 => dur beat;
1 => int counter;
SinOsc osc => dac;
while( counter <= 10)
{
  250 => osc.freq;
  0.5 => osc.gain;

beat => now;

300 => osc.freq;

beat / 2 => now;

400 => osc.freq;

beat / 2  => now;
counter++;
}
