
Pdef(\basse, 
	Pchain(
		Pdef(\_midi),
		Pbind(
			\octave, 3,
			\degree, p{ arg inval;
				Pindex(Array.rand(4,0,1000),
					Pseq([0,0,1,2,3,2], inf)
				).iter.do{ arg x;
					Pseq([
						Pseed(Pn(x,1), Pshuf([1,2,5,3,4])),
						0
					])
					.asStream.embedInStream(inval)
				}
			},
			\legato, 1,
			\dur, 2,
			\do, Pfunc{arg a; ~basse=a.degree},
		)
	)
).quant_([4, 0, 0.001]);
