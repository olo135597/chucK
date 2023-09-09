
TriOsc osc => dac;
0.25 => osc.gain;
[ 110, 220, 440, 660, 770, 880, 1320] @=> int frequencies[];

0 => int counter;
0 => int value;
while(counter < 100) {
    
    counter + 10 => counter;
    
    frequencies[value] + counter => frequencies[value];
     value++;
 
 for(0 => int i; i < frequencies.cap(); i++)
 {
    frequencies[i] => osc.freq;
    200 :: ms => now;
 }
}

[60, 62, 64, 65, 67, 69, 71, 72] @=> int pitches[];

while(true) {
    
 
 for(0 => int i; i < pitches.cap(); i++)
 {
    Std.mtof(pitches[i]) => osc.freq;
    200 :: ms => now;
 }
}