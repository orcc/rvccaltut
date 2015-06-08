# Lesson 2. Non-determinism

As was mentioned in previous lesson, actors may have multiple actions. So in the following example there are two.

```
package net.sf.orcc.tutorial.l02Nondeterminism;

actor NDMerge () int In1, int In2 ==> int Out :
	action In1: [x] ==> Out: [x] end
	action In2: [x] ==> Out: [x] end
end
```
This actor merges two input streams into one output. The first action takes a token from the input ```In1``` and sends it to the output ```Out```. The second one does the same but for the input ```In2```. However, from the description we cannot know how actor will behave if there are tokens available on both input ports at the same time. The order of output tokens will be undefined. This behaviour is called *non-deterministic*.

Generally, non-determinism means that the program can produce different output while processing the same input data. But in case of ```NDMerge``` the output is actually defined by the timings of the input streams. The ability to leave this choice open was added to the CAL language on purpose. For example, if there is no available data on the first stream, and there are data on the second stream, actor does not have to wait. It will send further the token from the input whichever will have it first. And if we know the timings of the input data, this actually will help to avoid stalls and unnecessary delays.

However, we can make an actor which will be really non-deterministic even if we know the timings of input data. The following example of ```NDSplit``` shows it. 

```
package net.sf.orcc.tutorial.l02Nondeterminism;

actor NDSplit () int In1 ==> int Out1, int Out2 :
	action In1: [x] ==> Out1: [x] end
	action In1: [x] ==> Out2: [x] end
end
```
Here we have one input and two outputs. Two actions always have condition to fire at the same moment.


You can try to build the network similar to the following one to simulate the non-deterministic behaviour. Whilst, because of deterministic nature of simulator algorithms results will not look random.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/02_01_Network.png)

