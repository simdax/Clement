(
~zynPath="../synth";
EZPopUpMenu(w,
	label:"fichier synth",
	items:
	PathName(~zynPath)
	.folders.collect({|x, i|
		["\\\\\\_________"++(i+1)++" voix________///" -> {}]
		++
		x.files.collect({|y|
			y.fileName -> {
				NetAddr("localhost", ~zynPort)
				.sendMsg("/load_xmz", y.absolutePath)
			}
		})
	}).flat
)
)
