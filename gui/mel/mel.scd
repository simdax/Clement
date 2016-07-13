(
Pdef(\mel, Pbind(
	\type, \midi, \midiout, MIDIOut(0),
	\degree,
	Pfunc
	{arg e; e.mel?0} +
	PdegreeToKey(
		Pfunc
		{arg e;	(e.arp ? 0 )},
		Pfunc
		{arg e; (e.acc ? [0,2,4])},
		7
	)
	+.x Plazy{ arg e; var orn=try{e.orn-1};
		[0].pseq +.x if(orn.asBoolean){Prand((-1..1), orn)}{[0].pseq}
	},
	\dur, Pn(Plazy{arg e;
		var orn=e.orn?1;
		e.dur.asArray.pseq
		*.x (e.orn!e.orn).reciprocal.pseq
	})
)
);

)