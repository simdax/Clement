(

Pdef(\mel,
	Ppar([
		Pdef(\_midi) <>
		Pbind(
			\chan, 2,
			\triade, Prand([0,0,1,1,2, 2], inf),			
			\degree, PdegreeToKey(
				Pkey(\triade),
				Pfunc
				{~basse+[0,2,4]}, 7
			),
			\dur, Pseq([
			8,8, Pfin(1, Pseq([2,4], inf).iter)
		], inf).reciprocal,	
			\inter,Pdiff(Pkey(\degree)),
			\mem, p{arg ev;
				var notes, durs, phrases;
				var now=thisThread.beats;
				loop
				{
					notes=notes.add(ev.degree);
					durs=durs.add(ev.degree);		
					if(ev.dur >= 0.5, {
						var pivots;
						phrases=phrases.add([notes, durs]);
						//index
						pivots=(
							phrases.last[1].order.reverse.at([0,1])
						);
						//cleanup
						notes==durs=nil; now=thisThread.beats;
					});					
					
					ev=0.yield;
				}
			},
		\mtranspose, Pseq([0,0], inf),
		\stretch, Pif(Pfunc{arg ev;ev.mtranspose==1}, 1,2),
		),
		// Pdef(\_midi) <>
		// Pbind( 
		// 	\ctlNum, 7, \chan, 2, 
		// 	\midicmd, \control,
		// 	\control, Pseg([110,215].pseq(inf), 4),
		// 	\dur, 0.5
		// ).trace
	])
).quant_(4).gui

)

