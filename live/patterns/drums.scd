// =====================================================================
// SuperCollider Workspace
// =====================================================================

(

var portBat=0;

~searchMidi={ arg n;
	var res=MIDIClient.destinations//do(_.post)
	.detectIndex{|x|
		n.matchRegexp(x.name)
	};
	if(res.postln.notNil, {
		MIDIOut.connect(portBat, res)
	}, {"pas trouvé".postln});
};

b ?? {b="hydrogen".unixCmd};

//~searchMidi.value(".ydrogen", portBat);

Pdef(\drums,
	Pdef(\_midi) <> (midiout:MIDIOut(portBat)) <>
	Pbind(
		\midinote,
		[40,40,50,40].pseq(inf),
		\dur, Pseq([4], inf).reciprocal,
		\amp, Env([0,1, 0], [8]).asPseg.repeat
	).trace
).quant_(4)


)

	