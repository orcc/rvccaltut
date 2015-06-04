# Lesson 2. Nondeterminism

As was mentioned in previous lesson, actors may have multiple actions.

```
package net.sf.orcc.tutorial.l02Nondeterminism;

actor NDMerge () int In1, int In2 ==> int Out :
	action In1: [x] ==> Out: [x] end
	action In2: [x] ==> Out: [x] end
end
```


```
package net.sf.orcc.tutorial.l02Nondeterminism;

actor NDSplit () int In1 ==> int Out1, int Out2 :
	action In1: [x] ==> Out1: [x] end
	action In1: [x] ==> Out2: [x] end
end
```
