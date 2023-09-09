//<<<"Samples and the SndBuf Ugen" >>>;

SndBuf guitar => dac;

me.dir() + "sounds_guitar.wav" => string filename;
filename => guitar.read;
// - is reverse
0.5 => guitar.rate;

5::second => now;

//Says then how long the sample is
//<<< guitar.samples() / 44100.0 >>>;

/*guitar.samples() => guitar.pos;

for(0 => int i; i < 8; i++)
{
    guitar.samples() / 2 => guitar.pos;
    0.2::second => now;
}

for(0 => int i; i < 8; i++)
{
    guitar.samples() / 4 => guitar.pos;
    0.2::second => now;
}

for(0 => int i; i < 8; i++)
{
    0 => guitar.pos;
    0.2::second => now;
}

for(0 => int i; i < 8; i++)
{
    0 => guitar.pos;
    0.2::second => now;
}*/