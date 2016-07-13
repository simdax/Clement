(
Pdef(\mel, Pbind(
	\type, \midi, \midiout, MIDIOut(0),
	\degree,
	Pfunc{arg e;  e.mel} +
	PdegreeToKey(
		Pfunc
		{arg e;	(e.arp ? 0 )},
		Pfunc
		{arg e; (e.acc ? [0,2,4])},
		7
	)
	+.x Plazy{ arg e;
		if(e.orn.asBoolean){Prand((-1..1), e.orn)}
		{[0].pseq}
	},
	\dur, Pn(Plazy{arg e;
		e.dur.asArray.pseq
		*.x (e.orn!e.orn).reciprocal.pseq
	})
)
);
)