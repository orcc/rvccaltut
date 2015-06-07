# Lesson 6. Priorities

```
package net.sf.orcc.tutorial.l06Priorities;

actor BiasedMerge () int A, int B ==> int Out :
	
	InA: action A: [x] ==> Out: [x] end
	InB: action B: [x] ==> Out: [x] end
	
	priority
		InA > InB;
	end
	
end
```

```
package net.sf.orcc.tutorial.l06Priorities;

actor FairMerge () int A, int B ==> int Out :

	One.a:  action A: [x] ==> Out: [x] end
	One.b:  action B: [x] ==> Out: [x] end
	Both.a: action A: [x], B: [y] ==> Out: [x,y] end
	Both.b: action A: [x], B: [y] ==> Out: [y,x] end
	
	priority
		Both > One;
	end

end
```

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/06_01_Network.png)
