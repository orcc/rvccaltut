# Control Flow

In previous lessons we learned about dataflow abstractions in RVC CAL:
such as actors, actions and XDF networks. But language itself contains
also elements of procedural paradigm.

Inside of each action you can utilize control flow constructions and
mutable variables.

#### Data types

Before we proceed with imperative elements of the language, it will
be essential to describe data types used in RVC CAL.

Data type                 | Example | Description
--------------------------|---------|---------
`bool`                    |  true   |  Boolean 
`int`                     | -21     |  Integer
`uint`                    |  42     |  Unsigned integer
`float`                   |  237.2  |  Floating point numbers
`String`                  | "Hello" |  Strings of characters
`List(type: T, size = N)` | [1,2,3] |  Finite lists of N elements of type T


There is probably no need in paying attention to the first five predefined RVC CAL
data types, but the last one `List` requires a little explanation.
RVC CAL support elements of functional programming paradigm which will be discussed
in the following lessons. But now within the imperative paradigm we can treat Lists
just as arrays. Furthermore, RVC CAL provides alternative syntax for lists:

`List(type: int, size = 64) foo` is equivalent to `int foo[64]`

so it even looks like arrays.

#### Assignments

Now we can continue with statements.

First you can define a mutable variable within an action, assign it with
initial value and change it during the action execution.

```
	action  ==> Out: [m]
	var
		int m := 0,
		int a[8]
	do
		m := 10;
		a := [0,1,2,3,4,5,6,7];
	end
```
Here you can see that we introduced a variable `m`, then changed its value and sent it to the output `Out`.


#### If-statement

```
	if m + n = 0
	then
		m := m + n;
	else
		n := m + n;
	end
```

```
	if m != 0
	then
		m := m + n;
	end
```



#### While-statement

```
	while n < 10
	do
		n := n + m;
	end
```



#### Foreach-statement

```
	foreach int i in 0 .. 7
	do
		sum := sum + n + i;
	end
```


