# Lesson 5. Schedules

The ```InterSelect``` example in the previous lessons implements a commolny used software design pattern called *finite state machines* but describing it in that way is not very easy to understand.

RVC CAL provides special sintax to describe fitite state machines. It is called *schedules*. The following example ```IterSelectFSM``` illustrates using of *schedules*

```
package net.sf.orcc.tutorial.l05Schedules;

actor IterSelectFSM () bool S, int A, int B ==> int Out :
	readT: action S: [sel] ==> guard sel end
	readF: action S: [sel] ==> guard not sel end
	copyA: action A: [x] ==> Out: [x] end
	copyB: action B: [x] ==> Out: [x] end
	
	schedule fsm init :
		init (readT)  --> waitA;
		init (readF)  --> waitB;
		waitA (copyA) --> init;
		waitB (copyB) --> init;
	end
end
```
First you need to recall that every action can have identifier or lable, e.g. here ```readT: action S: [sel] ==> guard sel end``` the name of the action is ```readT```. This lables are called *action tags*.

The block of code:
```
schedule fsm init :
	init (readT)  --> waitA;
	init (readF)  --> waitB;
	waitA (copyA) --> init;
	waitB (copyB) --> init;
end
```
describes our automaton. Basically, it is a textual representation of a finite state machine, given as a list of possible state transitions. The states of that finite state machine are the first and the last identifiers (```init```, ```waitA``` and ```waitB```) in those transitions represented with sign ```-->```. Relating this back to the original version of ```IterSelect```, these states are the possible values of the state variable, i.e. ```0```, ```1```, and ```2```. The initial state of the schedule is the one following ```schedule fsm```. In this example, it is ```init```.

Each state transition consists of three parts: the original state, a list of action tags, and the following state. For instance, in the transition ```init (readT) --> waitA;``` we have ```init``` as the original state, ```readT``` as the action tag, and ```waitA``` as the following state. The way to read this is that if the schedule is in state ```init``` and an action tagged with ```readT``` occurs, the schedule will subsequently be in state ```waitA```.



```
package net.sf.orcc.tutorial.l05Schedules;

actor AlmostFairMerge () int In1, int In2 ==> int Out :
	
	int state := 0;
	
	action In1: [x] ==> Out: [x]
	guard state = 0
	do
		state := 1;
	end
	
	action In2: [x] ==> Out: [x]
	guard state = 1
	do
		state := 0;
	end
	
end 
```

```
package net.sf.orcc.tutorial.l05Schedules;

actor AlmostFairMergeFSM () int In1, int In2 ==> int Out :
	
	A: action In1: [x] ==> Out: [x] end
	B: action In2: [x] ==> Out: [x] end
	
	schedule fsm S1 :
		S1 (A) --> S2;
		S2 (B) --> S1;
	end
	
end 
```

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/05_01_Network.png)
