(~instr.do { |x|
    x.sfz.prepare{"done"}
};
)

(
var d=5, sc=nil;
~deg2Not={
    arg d, sc, oct; 
    sc.performDegreeToKey(d) + (oct*12)
}
)

(
var io=~instr;
var deg2Not=~deg2Not;
Event.addEventType(\sfz,
    {
        var f={ arg id;
            var res=
            id.class.switch(
                Integer, {io[id]},
                String, {
                    io.select({|x| id.matchRegexp(x.name)});
                    switch(res.size, 0, {"no match".postln}, 1, {}, {res=res.choose});
                }
            );
            res.sfz.noteOn(60,
                 deg2Not.value(~degree, ~scale, ~octave)
            )
        };
        ~id.asArray.do { |x|
            f.(x)  
        };
    }
);

Pbind(
	\type, \sfz,
    \id, 0,
    \octave, 4,
    \degree, [0,1,2,3].iter,
).play

)

~instr[0].sfz.noteOn(60,46)