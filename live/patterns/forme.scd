(
var a={r{ arg in;
	var init=[];
	loop{
		var n=in.asArray;
		var res=(n.asSet -- init);
		init=n;
		in=(res.asArray).yield
	}
}};

var pforme={arg pattern;
	var b=a.value;
	var p=pattern.asStream, pval;
	r{
		while{pval=p.next; pval.notNil}
		{b.next(pval).yield};
	}
};

Pdef(\_forme,
	Pbind(
		\formeP, PlazyEnvir{
			arg forme=
			Pclump(Prand((1..3), inf), Pxrand((..5), inf));
			pforme.(forme, inf);
		},
		\dur, 1,
		\do, Pfunc{ arg ev;
		ev.formeP.do { |x|
			if(Pdef(x).isPlaying, {
				Pdef(x).stop
			}, {Pdef(x).play}
			)};
		}
)
)
.envir_((forme:[1,2,3,4]))
.gui

)


