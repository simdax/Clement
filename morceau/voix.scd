(
var mel=[7,6,5,4,2,7];
var r=[7,1,3,1,3,1]/4;

a=[
	(arp:[0], app:mel, dur:r,
		mtranspose:Pstep( Pseries(0,-1,3), r.sum),
		acc:Pfunc{~basse+[0,2,4]}),
	(arp:[0], app:[0,1,2,4,2,1], dur:[1]),
	(arp:[[0,1,2]], app:[0], dur:[4,8,4,8].reciprocal),
];
a.do { |x, i|
Pbindef(i.asSymbol,
	*x
	.collect({|x| x.pseq(inf) })
	.asPairs
)
};

)

