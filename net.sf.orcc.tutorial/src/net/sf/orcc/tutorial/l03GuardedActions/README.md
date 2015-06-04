# Lesson 3. Guarded actions


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
