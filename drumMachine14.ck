SndBuf kick => dac;
SndBuf snare => dac;
SndBuf cHat => dac;
SndBuf oHat => dac;
SndBuf clap => dac;


me.dir() + "kick.wav" => string kickFileName;
me.dir() + "c-hat.wav" => string cHatFileName;
me.dir() + "clap.wav" => string clapFileName;
me.dir() + "o-hat.wav" => string oHatFileName;
me.dir() + "snare.wav" => string snareFileName;

kickFileName => kick.read;
cHatFileName => cHat.read;
clapFileName => clap.read;
oHatFileName => oHat.read;
snareFileName => snare.read;

fun void SilenceAllBuffers()
{
    kick.samples() => kick.pos;
    snare.samples() => snare.pos;
    cHat.samples() => cHat.pos;
    oHat.samples() => oHat.pos;
    clap.samples() => clap.pos;
}

SilenceAllBuffers();
0.5::second => dur beat;

fun void Drum(int select, dur duration)
{
    if(select == 0)
    {
        0 => kick.pos;
        0 => cHat.pos;
    }
    if(select == 1)
    {
        0 => oHat.pos;
    }
    if(select == 2)
    {
        0 => kick.pos;
        0 => cHat.pos;
        0 => clap.pos;
    }
    duration => now;
    SilenceAllBuffers();
}


while(true)
{
    Math.random2(1, 2) => int durBeat;
Drum(0, beat / durBeat);
Drum(1, beat / 2);
Drum(2, beat / 2);
Drum(1, beat / 2);
Drum(0, beat / durBeat);
Drum(1, beat / 2);
Drum(2, beat / 2);
Drum(1, beat / 2);
Drum(0, beat / durBeat);
Drum(1, beat / 2);
Drum(2, beat / 2);
Drum(1, beat / 2);
}

/*while(true)
{
    for(0 => int i; i < 4; i++)
    {
        Drum(0, beat / 4);
    }
    Drum(2, beat / 2);
    Drum(0, beat / 4);
    Drum(0, beat / 4);
    for (0 => int i; i < 3; i++)
    {
        Drum(0, beat / 3);
    }
    Drum(2, beat);


}*/