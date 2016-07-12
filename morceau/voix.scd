(
var mel=[7,6,5,4,2,7]-7;
var r=[7,1,3,1,3,1]/4;

var accR=[4,8,8,4].reciprocal;

a=[
	(arp:[0], app:mel, dur:r,
		mtranspose:Pstep( Pseries(7,-1,inf), r.sum),
		acc:Pfunc{~basse+[0,2,4]}),
	(arp:[0], app:[0,1,-1,0], dur:accR),
	(arp:[[0,1,2]], app:[0], dur:accR),
];a
a.do { |x, i|
Pbindef(i.asSymbol,
	*x
	.collect({|x| x.pseq(inf) })
	.asPairs
)
};

)

