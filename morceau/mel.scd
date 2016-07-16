

(
var mel=[7,6,5,4,2]-7;
var mel2=[5,4];
var fins=[0,0,1];

var r=[7,1,3,1,3,1]/4;
var r2=[2,2];



Pdef(\0, Pbind(
	\mel, ~pforme.((a:mel, b:mel2, z:fins), [\a!3, \b].flat),
	\mtranspose, Pstep(Pseq([Pseries(7,-1,3), 0]), r.sum),
	\dur, Pseq([r.pseq(3), r2.pseq.trace], inf),
	\scale, Pfunc{~scale},
).trace
);

)
