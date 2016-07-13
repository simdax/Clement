(
var mel=[7,6,5,4,2,7]-7;
var r=[7,1,3,1,3,1]/4;

var accR=[4,8,8,4].reciprocal;

a=[
	(
		app:mel, dur:r, orn: [1, 4, 1, 3, 2],
		mtranspose:Pn(Pstep( Pseries(7,-1,3), r.sum)),
		//	acc:[0,2,4]
	),
	(app:[0,1,-1,0], dur:accR),
	(arp:[[0,1,2,3,4]], dur:accR),
];

a.do { |x, i|
Pbindef(i.asSymbol,
	*x
	.collect({|x| x.pseq(inf) })
	.asPairs
)
};

)