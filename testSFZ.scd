// =====================================================================
// SuperCollider Workspace
// =====================================================================

.///TEMPO
(
r{
	loop{
	TempoClock.tempo=Env([1.2,2], [10]).asPseg.iter;
	0.1.wait;
}
}.play
)


/// BASIS
(
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
Pdef(\midi, Pbind(\type, \midi, \midiout, MIDIOut(1)));
Event.addEventType(\sfz, {
	var amp=~amp.value; 
	var note=~midinote.value;
	if(amp<1){amp=60};
	r{
		~inst.noteOn(amp, note);
		(~dur*~legato).wait;
		~inst.noteOff(amp, note)
	}.play	
});
Pdef(\sfz,
	Pfset(
		{ var ok=false;
			~inst=a.prepare({ok=true});
			while{ok.not}{0.1.wait};
		},
		Pbind(
			\type, \sfz,
		),
		{a.free}
	)
);
Pdef(\harmo,
	Pbind(
		\scale, Pfunc{~scale ? Scale.major}
	)
);
Pdef(\out, 
	Pchain(
		Pdef(\midi),
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
			\do, Pfunc{arg a; ~basse=a.degree.postln},
		)
	)
).quant_([4, 0, 0.01]);

Pdef(\mel,
	Pdef(\harmo)<>
	Pdef(\midi)<>
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


)

PdefAllGui()

~basse=4