// =====================================================================
// SuperCollider Workspace
// =====================================================================

(
Pdef.removeAll; Window.closeAll;

//recursive load
f={arg p;
	p.entries.do { |x|
		if(x.postln.isFolder){f.value(x)}
		{x.absolutePath.load}
};
}; f.value(PathName("./patterns".resolveRelative));



/// BASIS
~basse=0;

if (~zyn.asBoolean.not){
	r{
		"zynaddsubfx -I alsa".unixCmd;
		1.wait;
		MIDIClient.init;
		MIDIOut.connect(1, MIDIClient.destinations
			.detect{|x| x.name=="ZynAddSubFX"}
		);
		~zyn=true;
	}.play
};

Pdef(\basse, 
	Pchain(
		Pdef(\_midi),
		Pbind(
			\octave, 3,
			\degree, p{ arg inval;
				Pindex(Array.rand(4,0,1000),
					Pseq([0,0,1,2,3,2], inf)
				).iter.do{ arg x;
					Pseq([
						Pseed(Pn(x,1), Pshuf([1,2,5,3,4])),
						0
					])
					.asStream.embedInStream(inval)
				}
			},
			\legato, 1,
			\dur, 2,
			\do, Pfunc{arg a; ~basse=a.degree},
		)
	).trace
).quant_([4, 0, 0.001]);

Pdef(\_mel,
	Pdef(\_harmo)<>
	Pdef(\_midi)<>
	Pbind(
		\octave, 6, \chan, 1,
		\degree, PdegreeToKey(
			p{ arg inval;
				Pseq([20,25,15,12,4,20], inf).do{ arg x;
					var nb=3;
					Pfin(nb,
						Pseed(x, Pwrand([0,1,2], [20, 15, 11].normalizeSum, nb)))
					.asStream.embedInStream(inval)
				}
			},
			Pchords(Pfunc{~basse}),
			7),
		//ambitus
		\degree, Pkey(\degree)%7,
		\dur, Pdefn(\rand),
		\amp, 100, 
	)
).quant_([4, 0,0]);

(..10).do { |x, i|
Pdef(i, Pbindf(Pdef(\_mel), \chan, i)).quant_(4)
};

PdefAllGui().filtering_(true);//.parent.alwaysOnTop_(true)
)

