(


var accR=[16].reciprocal;

a=[
	(
		// mel:~pforme.((a:mel, b:mel2, z:fins), [\a!3, \b].flat).trace,
		// mtranspose:Pstep(Pseq([Pseries(7,-1,3), 0]), r.sum),
		// dur:Pseq([r.pseq(3), r2.pseq.trace], inf),
	),
	(arp:[0,1,2, 3], dur:accR),
	(arp:[[0,1,2,3],0,[0,1,2]])
];

a.do { |x, i| if(x.isEmpty.not, {
	Pbindef(i.asSymbol,
		*x
		.collect({|v, k|
			k.switch(
				\orn, Pstutter(v.pseq(inf), v.pseq(inf)),
				\acc, v,
				\scale, v,
				v.asArray.pseq(inf)
			)
		})
		.asPairs
	)}
)
};

)
