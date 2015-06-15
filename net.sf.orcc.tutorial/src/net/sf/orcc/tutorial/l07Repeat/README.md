# Repeat Clause

During this lesson we will get back to *input patterns* and *output expressions*.

In the beginning of this tutorial we learned that *input pattern* of an action has
tow main functions:
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


