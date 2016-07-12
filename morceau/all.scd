(

Pdef.all.do(_.stop);
Pdef(\harmo).play;
[0,1,2].do{ |i|
    Pdef((\track++i).asSymbol).play
})

)

