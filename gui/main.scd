(
Window.closeAll;
Pdef.removeAll;

w=Window("bouya", Rect(0, 0, 400, 400)).front; w.addFlowLayout;

// zyn go!
~zynPath="~/.local/share/zynaddsubfx/zynaddsubfx-instruments/examples/";
"zynaddsubfx -U -P 1234".unixCmd;


"harmo/*".resolveRelative.loadPaths;
"mel/*".resolveRelative.loadPaths;
"synthGui.scd".loadRelative
)

