# Lesson 4. State variables

So far, we saw only how actions can fire on not fire on external conditions, but there was nothing inside of actor which could affect subsequent firerings.

The *state variables* are internal memory of an actor. They represent actor's the internal state. Actions within an actor can change its internal state and thereby atlernate subsequent firings.

The simplest example of using state variable is a ```Sum``` actor.
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
In line ```int sum := 0;``` we declare state variable ```sum``` and initialize it with zero. In this example you can also nitice that action can manipulate data within its body. In this case the code between ```do``` and ```end``` updates the state variable ```sum``` adding consumed token to it. Construction like that are usually accumulators. So here you can see that action not only cunsume input token and produce output, it also modifies internal state of the actor, which will affect the output of the next firing.

It is important to notice here (even thought it was mentioned in previous lessons) that the *output expression is evaluated after the action firing*. The value of ```sum``` in output expression ```Out: [sum]``` is the one which has been already updated by the action.

The previous example does not clearlly represent the *state meaning* of state variables. To explain that we will introduce the actor which selects the input stream according to internal state and send it the the output (recall ```Select``` actor from the previous lesson). 

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
Here in actor ```IterSelect``` we fisrt declare state variable ```int state := 0;```.

The first action consume token from the input ```S``` and does not produce any output. It just modifies the internal state. (You can notice that there is no output expression after sign ```==>```, but guard). So this action fires if current state is *zero* and changes it to ```1``` if there is ```true``` on the input ```S``` or to ```2``` if there is ```false```.

The second action changes ```state```to zero and copyies a token from input ```A``` to the output but only fires when  internal state variable ```state``` *current* value is ```1```. The third action do the same but only when ```state``` value is 2.

Note that ```Select``` and ```IterSelect``` are almost, but not entirely, equivalent. First of all, ```IterSelect``` makes twice as many steps in order to process the same number of tokens. Secondly, it actually reads, and therefore consumes, the S input token, irrespective of whether a matching data token is available on A or B. And unlike the previous examples, the ```IterSelect``` actor uses guards that depend on an actor state variable rather than on an input token.

It is possible to use combinations of state variables and input tokens in guards, which is illustrated in the following example.
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
Here we have to actions. One of them adds input token to the state variable ```sum``` and another substracts the input token from it depending on whether the token is less or not less then the value of ```sum``` itself.

You can build the network similar to the following diagram to experiment with these actors.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/04_01_Network.png)
