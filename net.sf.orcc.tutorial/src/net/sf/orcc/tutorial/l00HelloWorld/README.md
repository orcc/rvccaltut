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
RVC CAL is a language wich implements the Dataflow paradigm. This means that in order to run the application you need to build a network of actors. In our case the network will be degenerate and will consist of only one actor.

To build a network you need to create new XDF file. Go to  File > New > Other then select Orcc > XDF Network.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_05_Create_new_XDF.png) ![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_06_Create_new_XDF.png)

After empty XDF was created you have to add an instance of an actor.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_07_Create_new_XDF.png)

n empty XDF file will open. Click first on (Objects > Instance) in the palette, and then click on XDF file area to add an Instance in your network.

Name your instance "HelloInstance" to obtain this result:

Now, you have to link this instance to the actor you have created before. To do so, right-click on the instance and select Set/Update Refinement. Then, select the "Hello" actor in the newly opended box:

After your validation, "HelloInstance" should be displayed in blue (meaning that your instance is assigned to an actor). ~~This very simple instance does not contain any input or ouput port. Don't worry, this is normal: the Hello actor doesn't defines any port.~~


### Running simulation


---
[Main page](../../../../../../) | [Next lesson](../l01SimpleActor)
