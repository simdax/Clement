(


Pdef(\mel, Pbind(
	\type, \midi, \midiout, MIDIOut(0), 
	\degree, PdegreeToKey(
		Pfunc
		{arg e;	(e.arp ? 0 )},
		Pfunc
		{arg e; (e.acc ? [0,2,4])}
	)
	+.x Plazy{ arg e; ( e.appo ? 0 ).asArray.pseq} 
)
);

Pdef(\harmo,
	Pbind(\basse, Pwhite(0,6),
		\dur, Pfunc{arg e; e.dur},
		\acc, (Pkey(\basse)+[0,2,4]),
		\do, Pfunc{|x|
			"harmo! ".post;
			~harmo=x.acc.postln }
	)
).set(\dur, 1)
.gui.parent.alwaysOnTop_(true)

)


