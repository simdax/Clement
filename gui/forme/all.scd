(

Tdef(\all, {
	Pdef.all.do(_.stop);
	Pdef(\harmo).play;
	[0,1,2,3].do{ |i|
		Pdef((\track++i).asSymbol).play
	};	
});
TdefGui(Tdef(\all), parent:w);


Tdef(\stop, {
	~basse=0.postln; ~scale=Scale.major; ~harmo=[0,2,4];
	Pdef.all.do(_.stop);
});
TdefGui(Tdef(\stop), parent:w);



)