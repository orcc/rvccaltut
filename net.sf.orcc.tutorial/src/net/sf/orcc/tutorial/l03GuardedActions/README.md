# Lesson 3. Guarded actions

In previous lesson we have introduced nondeterminism of multiple actions within one actor. And even if we can eploite that property, surely in most of the cases it's undesireble.

RVC CAL provides options to restrict action fireing conditions. One of them is using *guards*. Is is a language construction which allows to spesify additional requirments for action to fire.

In the following example you can see how *guards* can be used.

```
package net.sf.orcc.tutorial.l03GuardedActions;

actor Split () int In ==> int P, int N :

	action In: [a] ==> P: [a]
	guard a >= 0
	end
	
	action In: [a] ==> N: [a]
	guard a < 0
	end
	
end
```
Line ```guard a >= 0``` in the definition of first action defines a condition: so tis action will fire only when the data on the input ```In``` will be greater or equal to zero. Simalar for the second action, ```guard a < 0``` means that it will fire only when data is less then zero.

It is important to notice that you are responsible for checking that the guard conditions of all actions withing an actor are exhaustive, i.e. cover all possible input. Othewise there will be cases when actor will stall forever.

Next example (which is wrong) shows what happens whe you are not following this rule.

```
package net.sf.orcc.tutorial.l03GuardedActions;

actor SplitDead () int In ==> int P, int N :
	
	action In: [a] ==> P: [a]
	guard a > 0 end
	
	action In: [a] ==> N: [a]
	guard a < 0 end
	
end
```
Guard in the first action covers all the positive numbers, and guard in the second action covers all the negative ones. But what happens if we have zero on the input ```In```? This token won't cause any action to fire and (therefore) won't be consumed, so no other tokens will come to the input ```In```. Actor will stall forever.




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
