# Repeat Clause

During this lesson we will get back to *input patterns* and *output expressions*.

In the beginning of this tutorial we learned that *input pattern* of an action has
two main functions:
1. Input pattern defined the requirements for action to fire based on tokens we have
on the input
2. Input pattern declares variables which will be used in the body of an action.

Simple examples which we studied did not cover all the possible variants of input data.
Let's have a look at the following example:

```
package net.sf.orcc.tutorial.l08Repeat;

actor Reduce () int In1 ==> int Out :

	action In1: [a1,a2,a3,a4,a5,a6,a7] ==> Out: [a6,a7]
	guard a1 mod 2 = 0
	end
	
end

```
Here we read seven tokens from the input and if the first one is an even number we
transfer last two tokens further to output `Out`.

As you can see even seven elements in the input pattern look excessive. And what if we need
to read 64 or 1024?

RVC CAL has special language construction called *repeat clause*. Look at the following
example.

```
package net.sf.orcc.tutorial.l08Repeat;

actor ReduceRP () int In1 ==> int Out :

	action In1: [a] repeat 15 ==> Out: [a] repeat 8
	guard a[0] mod 2 = 0
	end
	
end

```
Using keyword `repeat` we can tell the action to consume defined pattern multiple times.
Here we are reading 15 tokens if the first one is even.

>Note: You can refer to the consumed token `a` within the action's body as to an array: e.g. `a[2]`. So
actually `In1: [a] repeat 15` here defines an array `int a[15]` and initialize it with 15 input tokens of type `int`.

Similar construction can be used with output expression. Recall the first lesson: output expressions
contain a list of expressions to compute the values of output tokens.
As in example above, if we add *repeat clause*, our defined output token *won't be* just reproduced
n times. But we will sent first n elements of array `a[15]` to the output.


Sometimes using *repeat clause* could be tricky. The following example shows one of these cases: 

```
package net.sf.orcc.tutorial.l07Repeat;

actor SplitRP () int In1 ==> int Out1, int Out2, int Out3 :

	action 
		In1: [a,b,c] repeat 8
		==> 
		Out1: [a] repeat 8,
		Out2: [b] repeat 8,
		Out3: [c] repeat 8
	end
	
end
```
Here we have input pattern `[a,b,c] repeat 8`. This means that action will consume three
these tokens 8 times. So if we have on the input 

```[1,2,3,4,5,6,7,8,9,...,24]```

then within the action we will have arrays 
```
a[8] = [1,4,7,...,22]
b[8] = [2,5,8,...,23]
c[8] = [3,6,8,...,24]
``` 

The output expressions of the example just send all three arrays to three different outputs.


You can build networks for all these examples. And using actors `Source` and `Print` from `utils` package see how they behave.







