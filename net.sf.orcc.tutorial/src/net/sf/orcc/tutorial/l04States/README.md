# Lesson 4. States

So far, we saw only how actions can fire on not fire on external conditions, but there was nothing inside of actor which could affect subsequent firerings.

The *state variables* are internal memory of an actor. They represent actor's the internal state. Actions within an actor can change its internal state and thereby atlernate subsequent firings.


```
package net.sf.orcc.tutorial.l04States;

actor Sum () int In ==> int Out :
	int sum := 0;
	action In: [a] ==> Out: [sum]
	do
		sum := sum + a;
	end
end
```

```
package net.sf.orcc.tutorial.l04States;

actor SumOld () int In ==> int Out :
	int sum := 0;
	//action In: [a] ==> Out: [old sum] // NOT implemented in RVC Cal
	action In: [a] ==> Out: [sum]
	do
		sum := sum + a;
	end
end
```

```
package net.sf.orcc.tutorial.l04States;

actor IterSelect () bool S, int A, int B ==> int Out :
	
	int state := 0;
	action S: [sel] ==> guard state = 0
	do
		if sel then
			state := 1;
		else
			state := 2;
		end
	end
	
	action A: [x] ==> Out: [x]
	guard state = 1
	do
		state := 0;
	end
	
	action B: [x] ==> Out: [x]
	guard state = 2
	do
		state := 0;
	end
		 
end
```

```
package net.sf.orcc.tutorial.l04States;

actor AddOrSub () int In ==> int Out :

	int sum := 0;
	
	action In: [a] ==> Out: [sum]
	guard a > sum
	do
		sum := sum + a;
	end
	
	action In: [a] ==> Out: [sum]
	guard a <= sum
	do
		sum := sum - a;
	end

end
```

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/04_01_Network.png)
