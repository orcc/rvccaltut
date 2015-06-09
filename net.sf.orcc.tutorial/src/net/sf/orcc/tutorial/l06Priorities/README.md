# Lesson 6. Priorities

In the previous lessons we learnt about *guards*, *states* and *schedules*. But there is one more way to manage action firings in RVC CAL.

In case when conditions have met for more then one action to fire we can simply give higher priorities to some actions against others.

Following example explains how to use this in RVC CAL:
```
package net.sf.orcc.tutorial.l06Priorities;

actor BiasedMerge () int A, int B ==> int Out :
	
	InA: action A: [x] ==> Out: [x] end
	InB: action B: [x] ==> Out: [x] end
	
	priority
		InA > InB;
	end
	
end
```
Here we have two actions labelled ```InA``` and ```InB```. And the line ```InA > InB;``` in the ```priority ... end``` block tells the actor that ```InA``` has a higher priority than ```InB```. So in case when tokens will be available on both inputs ```A``` and ```B```, the token from input ```A``` will always go to the output fist.


The following example illustrates how we can give equal priorities to groups of actions.

```
package net.sf.orcc.tutorial.l06Priorities;

actor FairMerge () int A, int B ==> int Out :

	One.a:  action A: [x] ==> Out: [x] end
	One.b:  action B: [x] ==> Out: [x] end
	Both.a: action A: [x], B: [y] ==> Out: [x,y] end
	Both.b: action A: [x], B: [y] ==> Out: [y,x] end
	
	priority
		Both > One;
	end

end
```
First you have to pay attention to the action tagging. We can group actions labelling them in the way ```One.a```, ```One.b```. So here we have a group ```One```. Similarly, we tag other two actions to the group ```Both```.

And finally we give higher priority to the group ```Both```.


![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/06_01_Network.png)

