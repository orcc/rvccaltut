# Lesson 3. Guarded actions

In previous lesson we have introduced nondeterminism of multiple actions within one actor. And even if we can eploite that property, surely in most of the cases it's undesireble.

RVC CAL provides a number of options to restrict action fireing conditions. One of them is using *guards*. Is is a language constraction which allows to spesify additional requirments for action to fire.

```
package net.sf.orcc.tutorial.l03GuardedActions;

actor Split () int In ==> int P, int N :

	action In: [a] ==> P: [a]
	guard a >= 0 end
	
	action In: [a] ==> N: [a]
	guard a < 0 end
	
end
```


```
package net.sf.orcc.tutorial.l03GuardedActions;

actor SplitDead () int In ==> int P, int N :
	
	action In: [a] ==> P: [a]
	guard a > 0 end
	
	action In: [a] ==> N: [a]
	guard a < 0 end
	
end
```


```
package net.sf.orcc.tutorial.l03GuardedActions;

actor SplitND () int In ==> int P, int N :
	
	action In: [a] ==> P: [a]
	guard a >= 0 end
	
	action In: [a] ==> N: [a]
	guard a <= 0 end
	
end
```

```
package net.sf.orcc.tutorial.l03GuardedActions;

actor Select () bool S, int A, int B ==> int Out :

	action S: [sel], A: [x] ==> Out: [x]
	guard sel end
	
	action S: [sel], B: [x] ==> Out: [x]
	guard not sel end

end
```
