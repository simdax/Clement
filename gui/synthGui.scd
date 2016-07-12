(

EZPopUpMenu(w,
	label:"fichier synth",
	items:PathName(~zynPath)
	.entries.collect({|x|
		x.fileName -> {
			NetAddr("localhost", 1234).sendMsg("/load_xmz", x.absolutePath)
		}
	})
)
)
