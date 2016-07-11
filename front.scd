// =====================================================================
// SuperCollider Workspace
// =====================================================================
(
Pbindef(\1,
	\acc, Pfunc{~harmo },
	\appo, Pstep(4, Pshuf([0,2,0,1,2], inf)),
	\dur, [1,2,2].reciprocal.pseq(inf),
	\arp, [0].pseq(inf),
);

)

(
var t;
Window.closeAll;
Pdef.removeAll;
"templates.scd".loadRelative;
(0..9).do { |x|
	Pdef((\track++(x.asSymbol)),
		Pdef(\mel) <> Pdef(x.asSymbol, Pbind(\chan, x))
	).fadeTime_(5);
};
t=PdefAllGui().prefix_("track").filtering_(true);
t.parent.alwaysOnTop_(true)
)

