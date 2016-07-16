// =====================================================================
// SuperCollider Workspace
// =====================================================================

(
~pvolta={
	arg c, d;
	var a,b;
	p{
		arg inval;
		var res;
		#a, b=[c, d].collect(_.iter);
		loop{
			while{res=a.next; res.notNil}{res.yield};
			b.next.yield; a=c.iter
		}
	};
};

~pforme={
	arg dict, forme;
	p{ arg inval;
		var dict2=dict[\z].clump(1);
		var res=forme.collect({|x|
			dict.at(x).pseq
		}) +++ dict2;
		res.flat.pseq.embedInStream(inval)
	}
};
)

