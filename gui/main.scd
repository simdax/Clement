(
MIDIClient.init;

Window.closeAll;
Pdef.removeAll;

w=Window("bouya", Rect(0, 0, 300, 330)).front;
w.addFlowLayout;

~harmo=[0,2,4];
// zyn go!
~zynPath="~/.local/share/zynaddsubfx/zynaddsubfx-instruments/examples/";
~zynPort=12341;
r{
	"killall zynaddsubfx".unixCmd;
	0.2.wait;
	("zynaddsubfx --auto-connect -P "++~zynPort).unixCmd;
	1.wait;
	{
		var port=MIDIClient.destinations
		.detectIndex({arg x;
			x.name=="ZynAddSubFX"});
		MIDIOut.connect(0,port)
	}.value;

}.play;

//core
"harmo mel forme".split($ ).do { |x|
    (x++"/*").resolveRelative.loadPaths;
};

//music
"synthGui.scd".loadRelative;
"morceau/0.scd".loadRelative;
)

