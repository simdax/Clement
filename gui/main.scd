(

Window.closeAll;
Pdef.removeAll;
~harmo=[0,2,4]; i=0;

w=Window("bouya", Rect(0, 0, 300, 330)).front;
w.addFlowLayout;



// zyn go!
~zynPath="../synth".resolveRelative;
~zynPort=12341;
r{
	var port;
	"killall zynaddsubfx".unixCmd;
	0.2.wait;
	("zynaddsubfx --auto-connect -U -I alsa -P "++~zynPort).unixCmd;
	1.wait;
	MIDIClient.init;
	while{
		port=MIDIClient.destinations
		.detectIndex({arg x;
			x.name=="ZynAddSubFX"});
		port.isNil
	}
	{
		"searching".postln;
		0.2.yield;
		i=i+1; if(i > 15)
		{
			defer{StaticText(nil, Rect(300, 300, 100,100))
			.string_("pas de connection avec Zyn, verifier connec")
				.front};
			4.wait;
			0.exit;
		};
	};
	MIDIOut.connect(0,port)
}.play;

//core
"harmo mel forme".split($ ).do { |x|
    (x++"/*").resolveRelative.loadPaths;
};

//music
"synthGui.scd".loadRelative;
"morceau/0.scd".loadRelative;
)

