(
~basse=0;
Pdef(\harmo,
	Pbind(\basse, Prand([1,3,5], inf),
		\dur, Pfunc{arg e; e.dur},
		\acc, Pchords2(Pkey(\basse)),
		\do, Pfunc{|x|
			//			"basse + renv ".post;
			//			[~basse, ~harmo].postln;
			~basse=((~basse?0)+x.basse%7);
			~harmo=x.acc }
	)
).set(\dur, 1);


)
