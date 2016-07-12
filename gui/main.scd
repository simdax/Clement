(

"front.scd".loadRelative;
w.postln;
PdefGui(Pdef(\harmo), parent: w, numItems:2);
EZPopUpMenu(w,
	label:"fichier synth",
	items:PathName("../synth".resolveRelative)
	.entries.collect({|x| var file=x.fileName;
		var p=thisProcess.nowExecutingPath;
		(p+/+"../../synth"+/+file).postln;
		file -> {
			(p+/+"../../synth"+/+file).load;
		}
	})
)


)


