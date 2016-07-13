(
var mel=[7,6,5,4,2,7]-7;
var r=[7,1,3,1,3,1]/4;

var accR=[4,8,8,4].reciprocal;

a=[
	(
		mel:mel, dur:1, orn: [3, 2,1],
		mtranspose:Pn(Pstep( Pseries(7,-1,3), r.sum)),
		//	acc:[0,2,4]
	),
	(arp:[[0,1,2,3,4]], dur:accR),
];

a.do { |x, i|
Pbindef(i.asSymbol,
	*x
	.collect({|v, k|
		k.switch(
			\orn, Pstutter(v.pseq(inf), v.pseq(inf)).trace,
			v.asArray.pseq(inf)
		)
	}).postln
	.asPairs.postln
)
};

)
