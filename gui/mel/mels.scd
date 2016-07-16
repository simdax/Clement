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
			\acc, Pfunc{~harmo },
			\scale, Pfunc{~scale}
		)
		)
	).fadeTime_(5);
};
)

