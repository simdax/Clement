(

Tdef(\bob, {
	Pdef.all.do(_.stop);
	Pdef(\harmo).play;
	[0,1,2,3].do{ |i|
		Pdef((\track++i).asSymbol).play
	};	
});
TdefGui(Tdef(\bob), parent:w)

)
