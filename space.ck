TriOsc osc => NRev rev => dac;

0.5 => osc.gain;
0.15 => rev.mix;

[0, 4, 7] @=> int major[];
[0, 3, 7] @=> int minor[];

20 => int offset;
int position;

40::ms => dur eighth; //150

    0 => position;
for(48 => int i; i > 0; i--)
{
    i => position;
    for(0 => int j; j < 3; j++)
    {
       Std.mtof(minor[j] + offset + position) => osc.freq;
       eighth => now;
    }
}
