// =====================================================================
// SuperCollider Workspace
// =====================================================================

(
Window.closeAll;
Pdef.removeAll;
"templates.scd".loadRelative;
(0..9).do { |x|
	Pdef((\track++x).asSymbol,
		Pdef(\mel)
		<> // base patt
		Pdef(x.asSymbol, Pbind(
			\chan, x,
			\acc, Pfunc{~harmo }
		)
		)
	).fadeTime_(5);
};
w=Window("bouya", Rect(0, 0, 400, 400)).front; w.addFlowLayout;
t=PdefAllGui(numItems:8, parent:w).prefix_("track").filtering_(true)
.parent.alwaysOnTop_(true)
)

