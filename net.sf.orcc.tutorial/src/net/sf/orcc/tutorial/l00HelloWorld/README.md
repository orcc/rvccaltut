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

Click on Objects > Instance in the palette, and then click on XDF file area to add an Instance to your network.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_08_Create_instance.png)

Name your instance "Hello"

Now you have to link this instance to the actor created before. Right-click on the instance and select Set/Update Refinement.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_09_Link_actor.png)

Then, select the "HelloWorld" actor in the newly opended box.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_10_Link_actor.png)


After your validation, "Hello" should be displayed in blue (meaning that your instance is assigned to an actor).

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_11_Network_ready.png)

As you can see our instance has an input port, even thought we did not specify it. This is normal.

Don't forget to save all the files. Compilation will be done automatically.


### Running simulation

Right-click on the XDF file and (Run As > Orcc simulation).

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_12_Run_simulation.png)

In the "Select simulator" window, click OK.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_13_Run_simulation.png)

In the "Select input stimulus" window, select a random file (it will not be used by our example).

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_14_Run_simulation.png)

In the Run configuration wizard just click on Run.

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_15_Run_simulation.png)

You should see that in Eclipse's console:

![](https://raw.githubusercontent.com/eugeneu/rvccaltut/master/images/00_16_Run_simulation.png)


---
[Main page](../../../../../../) | [Next lesson](../l01SimpleActor)
