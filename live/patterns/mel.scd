(Pdef(\_mel,
	Pdef(\_harmo)<>
	Pdef(\_midi)<>
	Pbind(
		\octave, 6, \chan, 1,
		\degree, PdegreeToKey(
			p{ arg inval;
				Pseq([20,25,15,12,4,20], inf).do{ arg x;
					var nb=3;
					Pfin(nb,
						Pseed(x, Pwrand([0,1,2], [20, 15, 11].normalizeSum, nb)))
					.asStream.embedInStream(inval)
				}
			},
			Pchords(Pfunc{~basse}),
			7),
		//ambitus
		\degree, Pkey(\degree)%7,
		\dur, Pdefn(\rand),
		\amp, 100, 
	)
).quant_([4, 0,0]);
)