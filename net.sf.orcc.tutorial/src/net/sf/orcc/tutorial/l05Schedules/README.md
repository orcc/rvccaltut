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
First you need to recall that every action can have identifier or lable, e.g. here ```readT: action S: [sel] ==> guard sel end``` the name of the action is ```readT```.

The block of code:
```
schedule fsm init :
	init (readT)  --> waitA;
	init (readF)  --> waitB;
	waitA (copyA) --> init;
	waitB (copyB) --> init;
end
```
describes our automaton. It starts with the keywords ```schedule fsm``` followed by the label ```init```.


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

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/05_01_Network.png)
