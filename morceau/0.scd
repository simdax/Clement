(
var mel=[7,6,5,4,2,7]-7;
var r=[7,1,3,1,3,1]/4;

var accR=[4,8,8,4].reciprocal;

a=[
	(
		mel:mel, dur:r, orn:[1,2],
		mtranspose:Pn(Pstep( Pseries(7,-1,3), r.sum)),
		//		acc:Pfunc{~harmo}
	),
	(arp:[0,1,2,3,4], dur:accR),
	(arp:[[0,1,2],0,[0,1,2]])
];

a.do { |x, i|
Pbindef(i.asSymbol,
	*x
	.collect({|v, k|
		k.switch(
			\orn, Pstutter(v.pseq(inf), v.pseq(inf)),
			\acc, v,
			v.asArray.pseq(inf)
		)
	})
	.asPairs
)
};

)
