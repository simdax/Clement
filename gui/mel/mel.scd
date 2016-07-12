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
)