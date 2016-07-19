// =====================================================================
// SuperCollider Workspace
// =====================================================================


(

Pdefn(\rand, PlazyEnvir{ arg bob;
	bob.postln; 
	p{ arg inval;
		Pindex(
			Pstep(Pclump(6, Pwhite(0,100))).iter,
			[0,0,1,0].pseq
		).repeat.iter.do{arg x;
			Pconst(2, Pseed(x, Prand((0.125, 0.25 .. 1), inf)))
			.embedInStream(inval)
		}
	}
});
	
Pbind(\bob, 4, \io,  Pdefn(\rand)<>(bob:5) ).trace.play

)


