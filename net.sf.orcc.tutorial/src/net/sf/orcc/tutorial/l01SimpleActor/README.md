## Lesson 1. Simple Actor

In the previously created project create new package net.sf.orcc.tutorial.l01SimpleActor
Create new CAL file named ID.cal

One of the simplest actors that does anything at all is one that only copies a token from its input port to its output port. That is what the actor ID does:

Simple actor just copy the token from input to output unchanged.
```
package net.sf.orcc.tutorial.l01SimpleActor;

actor ID () int In ==> int Out :
  first: action In: [a] ==>  Out: [a] end
end
```

Creating new network

Litle about the syntax and code formating.
