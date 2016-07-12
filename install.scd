(
var url="https://github.com.simdax";
["patternsSC"].do{|x|
	Quarks.uninstall(url+/+x);
	Quarks.install(url+/+x)
};
0.exit
)


