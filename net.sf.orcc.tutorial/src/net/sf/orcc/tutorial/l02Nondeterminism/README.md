# Lesson 2. Nondeterminism

As was mentioned in previous lesson, actors may have multiple actions. So in the following example there are two.

```
package net.sf.orcc.tutorial.l02Nondeterminism;

actor NDMerge () int In1, int In2 ==> int Out :
	action In1: [x] ==> Out: [x] end
	action In2: [x] ==> Out: [x] end
end
```
This actor merges two input streams into one output. The first action takes a token from the input ```In1``` and sends it to the output ```Out```. The second one does the same but for the input ```In2```. However, from the description we cannot know how actor will behave if there are tokens available on both input ports at the same time. The order of output tokens will be undefined. This behavior is called *nondeterministic*.



```
package net.sf.orcc.tutorial.l02Nondeterminism;

actor NDSplit () int In1 ==> int Out1, int Out2 :
	action In1: [x] ==> Out1: [x] end
	action In1: [x] ==> Out2: [x] end
end
```


You can try to build the network similar to the following one to simulate the nondetermistic behavior. Whilst, because of deterministic nature of simulator algorithms results will not look random.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/02_01_Network.png)

