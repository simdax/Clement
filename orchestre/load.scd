// =====================================================================
// SuperCollider Workspace
// =====================================================================

(
Quarks.install("https://github.com/snappizz/supercollider-sfz")
)
(
s.boot;
~instr=PathName("~/Musique/soundfonts/sonatina").entries.select({|x|
	"[a-z]*sfz".matchRegexp(x.fileName) })
.collect{ |x|
    (name:x.fileName, sfz:SFZ(x.absolutePath))
};
)
