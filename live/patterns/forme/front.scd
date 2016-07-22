(
var taille=16;
var array=nil!taille;
SimpleController(array).put(\forme, {
	Pdef(\_forme).envir.forme=array.reject(_==nil).bubble;	
});


a=Window("bob", 350@80).front;
b=FlowView(a, 85@75);
16.collect{ arg x;
	CheckBox(b).action_{ arg s;
		if(s.value){array[x]=x;}
		{array[x]=nil};
		array.changed(\forme)
	}
};
PdefGui(
	Pdef(\_forme), numItems:2, parent:a, bounds:Rect(80,0,80,80)
)


)

