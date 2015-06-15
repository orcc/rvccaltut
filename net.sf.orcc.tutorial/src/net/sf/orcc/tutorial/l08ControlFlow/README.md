# Control Flow

In previous lessons we learned about dataflow abstractions in RVC CAL: 
such as actors, actions and XDF networks. But language itself contains
also elements of procedural paradigm.

Inside of each action you can utilize control flow constructions and
mutable variables.

#### Data types

Before we proceed with imperative elements of the language, it will
be essential to describe data types used in RVC CAL.

The following table shows all predefined data types used in RVC CAL.

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
	action  ==> Out: [m,a[0]]
	var
		int m := 0,
		int a[8]
	do
		m := 10;
		a := [0,1,2,3,4,5,6,7];
		a[3] := m;
	end
```
Every action can contain local variables which should be introduced in the block
preceded by the keyword `var` just after the action declaration. You can also initialize
variables with values using operator `:=`. Definitions of different variables should be 
separated by commas.

You can change values of variables using assignment statements within the body of action
which is bounded by keywords `do ... end`. Each statement should be terminated with semicolon.

You can find how to compose working example with assignments here:

```
package net.sf.orcc.tutorial.l08ControlFlow;

actor Fibonacci () ==> int Out :
	int fib[2] := [0,1];
	int counter := 0;
	
	action  ==> Out: [fib[0]]
	guard
		counter < 20
	var
		int tmp
	do
		// Evaluate next Fibonacci number
		tmp := fib[1];
		fib[1] := fib[0] + fib[1];
		fib[0] := tmp;
		
		// Increment counter
		counter := counter + 1;
	end

end
```
Actor in this example produce a sequence of Fibonacci numbers.


The following sections describe control flow constructions of RVC CAL.

#### If-statement

First control flow statement we will learn is an if-statement. Almost every language has this kind
of constructions so you probably are familiar with it.

If-statement in RVC CAL has the following syntax

```
	if m > 0
	then
		m := m + n;
	else
		n := m + n;
	end
```

You can omit the `else` part.

```
	if m != 0
	then
		m := m + n;
	end
```

List of logical operators

Operator | Description
---------|-------------
 =       | equal
 !=      | not equal
 >       | greater then
 <       | less then
 >=      | greater or equal
 <=      | less or equal


#### While-statement

Syntax for the while-statement is the following

```
	while n < 10
	do
		n := n + m;
	end
```


#### Foreach-statement

Foreach-statement has syntax like that:

```
	foreach int i in 0 .. 7
	do
		sum := sum + n + i;
	end
```


