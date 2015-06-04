## Lesson 1. Simple Actor

#### Structure of actors

*Actors* perform their computation in a sequence of steps called *firings*. In each of those steps

the actor:

1. may consume tokens from its input ports
2. may produce tokens at its output ports
3. may modify its internal state (this is described in further lessons)

Describing an actor involves describing its interface to the outside, the ports, the structure of its internal state, as well as the steps it can perform, what these steps do (in terms of token production and consumption, and the update of the actor state), and how to pick the step that the actor will perform next.

#### The simpliest actor

The simpliest actor just copies a token from the input to the output unchanged.
```
package net.sf.orcc.tutorial.l01SimpleActor;

actor ID () int In ==> int Out :
  first: action In: [a] ==>  Out: [a] end
end
```
In the first line we specify the pakage.

The main entity in RVC CAL is an *actor*. In the example above you see that to describe an actor one should use keyword ```actor``` followed by the name of the actor and paremeters in parentheses (empty in this example).
Then you specify input ports before the sign ```==>```, and output ports after this sign. RVC CAL is a *statically typed* language, so you need explicitely define type for each variable, i.e. in the line ```actor ID () int In ==> int Out :``` ports ```In``` and ```Out``` both are of type ```int```.
The colon at the end of the line marks the start of the actor body which is bounded by the keyword  ```end``` from the other side.

Inside of the body each actor has one or more *actions*, which execute (*fire*) at one step each. Actions may (or may not) *consume* input tokens and *produce* output tokens at each step.
Syntax of describing an action in RVC CAL is the following: ```first: ``` is an *optional* identifier of an action, which can be ommited. After keyword ```action``` and in front of ```==>``` sign you see the *input pattern*.

```
actor <ActorIdentifier> () <input ports> ==> <output ports> :
  [<ActionIdentifier>:] action <input pattern> ==> <output expression> end
end
```

*Input pattern* specifies how many tokens to consume from which ports and how to call these tokens in the rest of the action. The input pattern in ```ID``` actor is ```In: [a]```. It tells the action to consume one token from the input ```In``` and name it ```a``` within the action body. *Input pattern* of action realize the idea of [pattern matching](http://en.wikipedia.org/wiki/Pattern_matching).

The expression following ```==>``` sign is an *output expression*. It defines the number and values of output tokens which will be produced on each output port by each *firing* of the action. In this example ```Out: [a]``` is an *output expression*. It defines that exactly one token will be pruduced on output port ```Out```, and the value of that token will be ```a```.

It is important to understand the difference between *input pettern* and *output expression*.  In the input pattern the local variable ```a``` is daclared and assigned with the value of input token whenever action has just fired. The output expression uses that variable and send the value of ```a``` as a produced token to the output port at the end of the action firing.

#### Running the examples

In the previously created project create new package net.sf.orcc.tutorial.l01SimpleActor

Create new CAL file named ID.cal and copy the following code there.
```
package net.sf.orcc.tutorial.l01SimpleActor;

actor ID () int In ==> int Out :
  first: action In: [a] ==>  Out: [a] end
end
```

In order to build working network we will need several additional actors to produce data and print results to the console.
For this example we will use ```Source``` and ```Printer``` actors as utilities. You can just dowload them from the [Github repo](/net.sf.orcc.tutorial/src/net/sf/orcc/tutorial/utils) and add to your project.

Now you can create the network just following the steps from previous lesson [Hello world](/net.sf.orcc.tutorial/src/net/sf/orcc/tutorial/l00HelloWorld).

After you add instances of actors: ```ID```, ```Source``` and ```Printer```. Connect ```Source``` output to ```ID``` input, and ```ID``` output to ```Printer ``` input.

>Hint: You can just drug-and-drop actor file from Project explorer pane to the XDF netwok diagram to add an instance of actor.

Now you can run example as was described in the previous lesson and see the result in the console.

![image](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/01_01_ID_actor.png)

#### Other simple actors


##### Add

```
package net.sf.orcc.tutorial.l01SimpleActor;

actor Add () int In1, int In2 ==> int Out :
	action In1: [a], In2: [b] ==> Out: [a+b]
	end
end
```

##### AddSeq

```
package net.sf.orcc.tutorial.l01SimpleActor;

actor AddSeq () int In1 ==> int Out :
	action In1: [a, b] ==> Out: [a+b]
	end
end
```

##### AddSubSeq

```
package net.sf.orcc.tutorial.l01SimpleActor;

actor AddSubSeq () int In1 ==> int Out :
	action In1: [a, b] ==> Out: [a+b,a-b]
	end
end
```

##### Scale

```
package net.sf.orcc.tutorial.l01SimpleActor;

actor Scale (int k = 1) int In ==> int Out :
	action In: [a] ==> Out: [k*a]
	end
end
```

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/01_02_Simple_actors.png)
