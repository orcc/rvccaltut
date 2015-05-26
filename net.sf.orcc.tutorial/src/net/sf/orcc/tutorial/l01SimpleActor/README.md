## Lesson 1
## Simple Actor

Simple actor just copy the token from input to output unchanged.
```java
actor Add () int In1, int In2 ==> int Out :
	action In1: [a], In2: [b] ==> Out: [a+b]
	end
end
```
