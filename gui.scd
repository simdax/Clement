(

b=Button(~wAc)
.states_([
	["play?", Color.red],
	["stop?", Color.red]
])
.action_{
	if(Pdef(\acc).isPlaying){Pdef(\acc).stop}{Pdef(\acc).play}
};

Button(~wAc).states_([
	["arpege"],
	["accord"]
])
.action_{ arg self;
	Pdef(\acc).set(\arp,
		[
			[0,1,2],
			[[0,1,2]]
		][self.value]
	)
}

)
(

Window.closeAll;

w=Window().front;

b=Button(w)
.states_([
	["play?", Color.red],
	["stop?", Color.red]
])
.action_{
	if(Pdef(\all).isPlaying){Pdef(\all).stop}{Pdef(\all).play}
};

if(Pdef(\all).isPlaying, {
    b.value=1
});

)