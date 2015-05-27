# RVC CAL Tutorial

RVC CAL is a [standardized](http://www.iso.org/iso/home/store/catalogue_ics/catalogue_detail_ics.htm?csnumber=66155) version of the [CAL Actor Language](http://en.wikipedia.org/wiki/CAL_Actor_Language) which implements [dataflow model](http://en.wikipedia.org/wiki/Dataflow_programming) of computation.

All the examples of this tutorial are written for and tested with ORCC tools.

[Open RVC CAL Compiler (ORCC)](http://orcc.sourceforge.net/) is an open-source Integrated Development Environment based on Eclipse and dedicated to dataflow programming. The primary purpose of Orcc is to provide developers with a compiler infrastructure to allow software/hardware code to be generated from dataflow descriptions.

## Installing ORCC
Before you start, you have to install all the tools needed for compiling and running provided examples.
Open RVC CAL Compiler (Orcc) is made for the Eclipse platform. So in order to use it you will need to install Java Runtime Environment and Eclipse IDE.

#### Java Runtime Environment
You can download and install the latest JRE release from [java.com](https://java.com/en/download/). ORCC reqires version 1.6 of higher of JRE.

#### Eclipse
Install Eclipse

#### ORCC plugin for Eclipce
Install plugin. Stable of from nightly builds if you want to run other applications from [orc-apps](https://github.com/orcc/orc-apps)

### List of contetns
0. [Hello World](./src/net/sf/orcc/tutorial/l00HelloWorld). This lesson shows how to compile and run an application.
1. [Simple actor](./src/net/sf/orcc/tutorial/l01SimpleActor). The simplest language constructions which follow the dataflow model is intoduced.
2. [Nondeterminism](./src/net/sf/orcc/tutorial/l02Nondeterminism). Nondeterministic nature of unconstrained multiple actions of the same actor is explained.
3. [Guarded actions](./src/net/sf/orcc/tutorial/l03GuardedActions). The way to restrict actions executions with conditions is introduced. 
4. [States](./src/net/sf/orcc/tutorial/l04States). The memory (or States) of actors which can affect the consequent executions is introduced.
5. [Schedules](./src/net/sf/orcc/tutorial/l05Schedules). Schedules is a convienient way to implement finite state machines.
6. [Priorities](./src/net/sf/orcc/tutorial/l06Priorities). 
