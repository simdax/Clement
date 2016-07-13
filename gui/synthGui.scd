(

EZPopUpMenu(w,
	label:"fichier synth",
	items:PathName(~zynPath)
	.entries.collect({|x|
		x.fileName -> {
			NetAddr("localhost", ~zynPort)
			.sendMsg("/load_xmz", x.absolutePath)
		}
	})
)
)
