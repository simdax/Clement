// =====================================================================
// SuperCollider Workspace
// =====================================================================

(
Quarks.install("https://github.com/snappizz/supercollider-sfz")
)
(
s.boot;
~instr=PathName("~/Musique/soundfonts/sonatina").entries.select({|x|
	"[:alpha:]*sfz".matchRegexp(x.fileName)
})[
	Pxrand((..50), 10).iter.nextN(10)
]
.collect{ |x|
    (name:x.fileName, sfz:SFZ(x.absolutePath))
};
)
