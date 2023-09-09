 // make our patch
      SinOsc s => dac;

      // time-loop, in which the osc's frequency is changed every 100 ms
      for(200 => int i; i < 40; i++){
          100::ms => now;
           450 => s.freq;
      
      }
         