


(

(
var mel=[7,6,5,4,2,7];
var r=[7,1,3,1,3,1];

r=(r!3) ++ [8,8]; r=r.flat *1/4;
mel={arg i=0;
	if(i==(-2)){mel+i}
	{(mel+i)++thisFunction.value(i-1)}
}.value ++ [5,4];

Pdef(\mel,
	Pbind(
		\degree, mel.pseq, \dur, r.pseq
	).midi(0,0)
)

);

(
var basse=[0, 4, 1,4,2,5,3,4];

var r=2;


Pdef(\basse,
	Pbind(
		\degree, p{ arg inval;
			var basS=basse.pseq().asStream;
			var val;
			while{val=basS.next; val.notNil}{
				val.yield
			};
			inval
		},
		\octave, [3,4],
		\legato, 1,
		\dur, r,
	).midi(0,[1,2])
);

Pdef(\basseMieux, Pbind(
	\gate, false,
	\degree, basse.pseq +.x Pseq([0, Pxrand([0,2,4], 3)])
	// +.x	Plazy{ arg envir;
	// 	var res=[0, [0, 1]].choose;
	// 	if(res.isArray)
	// 	{
	// 		envir.gate=true;
	// 		res.pseq
	// 	}
	// 	{
	// 		envir.gate=false;
	// 		res				
	// 	}
	// }
	,
	\degree, Pif(Pkey(\degree)>10, Pkey(\degree)-7, Pkey(\degree)),
	\octave, 3, 
	\dur, Pn(Plazy{arg e; var res;
		res=if (e.gate){(r/8)!2}{r/4};
		res.pseq
	})
).midi(0,[1,2])
)
)




)

