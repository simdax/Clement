(
Pdefn(\scale,
	Pfunc{ arg ev;
		if(ev.degree==2){
			~scale=Scale.lydian
		}{Scale.major}
	}
);
Pdef(\_harmo,
	Pbind(
		\scale, Pfunc{~scale ? Scale.major}
	)
);

)