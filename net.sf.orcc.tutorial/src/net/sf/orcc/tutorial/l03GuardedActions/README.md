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

Moreover, besides being exhaustive *guards* in an actor should not have overlaped ranges. It can cause the errors explained in the following example.

```
package net.sf.orcc.tutorial.l03GuardedActions;

actor SplitND () int In ==> int P, int N :
	
	action In: [a] ==> P: [a]
	guard a >= 0 end
	
	action In: [a] ==> N: [a]
	guard a <= 0 end
	
end
```
Here we have two guards: one is ```guard a >= 0``` and another is ```guard a <= 0```. So the fisrt action fires when there is a non-negative number on the input ```In```and the second action fires when there is a non-positive one. As you can notice, zero satisfy conditions for both. It means that in case of zero on the input we will have the same non-determinism problem which was described in the previous lesson.

Final and important fact about the *guards* is that when gaurding conditions is not fulfiled the action does not fire and *the token is not consumed* and remains on the input so it could be consumed by the next fireing or another action.  It can be illustrated in the following example.

```
package net.sf.orcc.tutorial.l03GuardedActions;

actor Select () bool S, int A, int B ==> int Out :

	action S: [sel], A: [x] ==> Out: [x]
	guard sel end
	
	action S: [sel], B: [x] ==> Out: [x]
	guard not sel end

end
```
The code above is similar to the ```NDMerge``` from the previous lesson, besides it has an additoinal input ```bool S```, data from which is used to select action to fire. So in the exemple here, when we have tokens available on all three inputs, and token from input ```S``` is ```false```, the first action *check it but does not consume it* so the second action can consume it, fire, and send the data from input ```A``` to the output.


Now you can try to buid network like the following. For the boolen input of the actor from the last example you will need special source generator BoolGen. You can download it wrom Github repository [here](/net.sf.orcc.tutorial/src/net/sf/orcc/tutorial/utils/BoolGen.cal). ```BoolGen``` actor generates an infinite sequence of ```[true, false, true, false,...]```.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/03_01_Network.png)

