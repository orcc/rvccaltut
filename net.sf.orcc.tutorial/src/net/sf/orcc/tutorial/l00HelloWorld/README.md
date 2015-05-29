# Lesson 0. Hello world

### Creating new project
First you need to create new ORCC project. 

In the menu "File > New > Other..." chose "ORCC > Orcc Project"

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_01_Create_new_orcc_project.png)

Specify the name of the project and click finish.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_02_Create_new_orcc_project.png)

You will see that default src directory has been added to the created project.

### Create new package

Right Click on the src folder in Project Exploer pane. New > Package

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_03_Create_new_package.png)

### Creating Actor
In Project exploer pane, select package you just created. Then click menu "File > New > File..."
Specify the name and the extention .cal

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_04_Create_new_actor.png)

After file was created, add the following code there and save it. Eclipse will automatically compile the file.

```
package net.sf.orcc.tutorial.l00HelloWorld;

actor HelloWorld () int In ==> :
	action ==>
	do
		print("Hello World!\n");
	end
end
```
The code above implements the actor named `HelloWorld()` which takes the input stream of tokens of type `int`.

The action within this actor always executes regardless to any input or other conditions and prints the string to the default output.

You will find detailed explanation of the syntax in next lessons.

### Creating Network

### Running simulation


---
[Main page](../../../../../../) | [Next lesson](../l01SimpleActor)
