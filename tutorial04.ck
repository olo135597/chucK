<<<"Our first sound">>>;

SqrOsc osc => dac => WvOut waveOut => blackhole; //Digital Audio converter

"test.wav" => waveOut.wavFilename;

440 => osc.freq; //Oscillator frequency

0.5 => osc.gain; // Gain parameter

1::second => now; // One second now