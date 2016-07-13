// =====================================================================
// SuperCollider Workspace
// =====================================================================

(
(0..9).do { |x|
	Pdef((\track++x).asSymbol,
		Pdef(\mel)
		<> 
		Pdef(x.asSymbol, Pbind(
			\chan, x,
			\acc, Pfunc{~harmo }
		)
		)
	).fadeTime_(5);
};
)

