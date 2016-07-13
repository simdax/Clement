(
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
	("zynaddsubfx -P "++~zynPort).unixCmd
}.play;

"harmo mel forme".split($ ).do { |x|
    (x++"/*").resolveRelative.loadPaths;
};
"synthGui.scd".postln.loadRelative;
"morceau/0.scd".loadRelative;
)

