(
var accords=[0,5,1,1,1,1,1,4].pseq();
var r=2;
var couleur=[\norm!3, \alt, \norm, \min, \dim, \norm].flat;
var baseScale=Scale.major.degrees;
var scales=(
	norm:baseScale,
	alt:baseScale + [-1,-1,-1,0,0,-1,-1],
	min:baseScale + [0,0,0,0,0,-1,0],
	dim:baseScale + [0,1,0,1,0,0,0],
);

Pdef(\harmo,
	Pbind(
		\basse, accords,
		\dur, Pfunc{arg e; e.dur},
		\acc, Pchords2(Pkey(\basse).differentiate),
		\scale, Pdict(scales,couleur.pseq),
		\do, Pfunc{|x|
			~scale=x.scale;
			~basse=x.basse%7;
			~harmo=x.acc;
			"basse + accord : ".post;
			[~basse, ~harmo].postln;
		}
	).trace 
).set(\dur, r);
)


