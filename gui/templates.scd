(


Pdef(\mel, Pbind(
	\type, \midi, \midiout, MIDIOut(0), 
	\degree, PdegreeToKey(
		Pfunc
		{arg e;	(e.arp ? 0 )},
		Pfunc
		{arg e; (e.acc ? [0,2,4])}
	)
	+.x Plazy{ arg e; ( e.app ? 0 ).asArray.pseq} 
)
);

~basse=0;
Pdef(\harmo,
	Pbind(\basse, Prand([1,3,5], inf),
		\dur, Pfunc{arg e; e.dur},
		\acc, Pchords2(Pkey(\basse)),
		\do, Pfunc{|x|
			"basse + renv ".post;
			~basse=((~basse?0)+x.basse%7).postln;
			~harmo=x.acc.postln }
	)
).set(\dur, 1);


)
