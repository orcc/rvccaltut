## Lesson 1. Simple Actor

Actors perform their computation in a sequence of steps called firings. In each of those steps

the actor:

1. may consume tokens from its input ports
2. may produce tokens at its output ports
3. may modify its internal state (this is described in further lessons)

Describing an actor involves describing its interface to the outside, the ports, the structure of its internal state, as well as the steps it can perform, what these steps do (in terms of token production and consumption, and the update of the actor state), and how to pick the step that the actor will perform next. This section discusses some of the constructs in the CAL language that deal with these issues.

Simple actor just copy the token from input to output unchanged.
```
package net.sf.orcc.tutorial.l01SimpleActor;

actor ID () int In ==> int Out :
  first: action In: [a] ==>  Out: [a] end
end
```

In the previously created project create new package net.sf.orcc.tutorial.l01SimpleActor
Create new CAL file named ID.cal

One of the simplest actors that does anything at all is one that only copies a token from its input port to its output port. That is what the actor ID does:

Creating new network

Litle about the syntax and code formating.
