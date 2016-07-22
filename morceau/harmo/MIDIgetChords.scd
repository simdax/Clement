// =====================================================================
// SuperCollider Workspace
// =====================================================================

(
var bob={thisThread.beats};
var now=bob.value;
~notes=nil;
MIDIdef.noteOn(\bob, {arg b, bb ... gf;
	if((bob.value -now.postln) < 0.01){~chord=~chord.add(bb)}
	{~chord=[bb]};
	now=bob.value;
});
MIDIdef.noteOn(\bob2,{
	r{
		"jkl".postln;
		0.2.wait;
		~notes=~notes.add(~chord)
	}.play
} )
)


)
