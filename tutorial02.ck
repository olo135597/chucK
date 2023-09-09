<<<"Our first sound">>>;

SinOsc osc => dac; //Digital Audio converter

440 => osc.freq; //Oscillator frequency

0.5 => osc.gain; // Gain parameter

1::second => now; // One second now