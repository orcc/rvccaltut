## Lesson 1. Simple Actor

#### Structure of actors

Actors perform their computation in a sequence of steps called firings. In each of those steps

the actor:

1. may consume tokens from its input ports
2. may produce tokens at its output ports
3. may modify its internal state (this is described in further lessons)

Describing an actor involves describing its interface to the outside, the ports, the structure of its internal state, as well as the steps it can perform, what these steps do (in terms of token production and consumption, and the update of the actor state), and how to pick the step that the actor will perform next.

#### Implementing a simple actor

The simpliest actor just copies a token from the input to the output unchanged.
```
package net.sf.orcc.tutorial.l01SimpleActor;

actor ID () int In ==> int Out :
  first: action In: [a] ==>  Out: [a] end
end
```
In the first line we specify the pakage.

The main entity in RVC CAL is an actor. In the example above you see that to describe an actor one should use keyword ```actor``` followed by the name of the actor and paremeters in parentheses (empty in this example).
Then you specify input ports before the sign ```==>```, and output ports after this sign. RVC CAL is a statically typed language, so you need explicitely define type for each variable, i.e. in the line ```actor ID () int In ==> int Out :``` ports ```In``` and ```Out``` both are of type ```Int```.
The colon at the end of the line marks the start of the actor body which is bounded by the keyword  ```end``` from the other side.

Inside the body each actor has one or more actions. 

In the previously created project create new package net.sf.orcc.tutorial.l01SimpleActor
Create new CAL file named ID.cal

One of the simplest actors that does anything at all is one that only copies a token from its input port to its output port. That is what the actor ID does:

Creating new network

Litle about the syntax and code formating.
