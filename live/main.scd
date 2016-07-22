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
		"zynaddsubfx -I alsa --auto-connect -l /home/simdax/Musique/zyn.xmz".unixCmd;
		1.wait;
		MIDIClient.init;
		MIDIOut.connect(1, MIDIClient.destinations
			.detect{|x| x.name=="ZynAddSubFX"}
		);
		~zyn=true;
	}.play
};


(..10).do { |x, i|
Pdef(i, Pbindf(Pdef(\_mel), \chan, i)).quant_(4)
};

PdefAllGui().filtering_(true);//.parent.alwaysOnTop_(true)
)

