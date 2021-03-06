# Installing ORCC Tools

Before you start, you have to install all the tools needed for compiling and running provided examples.
Open RVC CAL Compiler (Orcc) is made for the Eclipse platform. So in order to use it you will need to install Java Runtime Environment and Eclipse IDE.

#### Java Runtime Environment
ORCC requires version 1.6 of higher of JRE. You can download and install the latest JRE release from [java.com](https://java.com/en/download/).
To use *Eclipse IDE for Java Developers edition*, you will need to instal Java Development Kit (JDK) as well, which you can download from the [Oracle website](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

#### Eclipse
ORCC is compatible with Eclipse versions 4.3 and higher

You can download and install Eclipse IDE from https://www.eclipse.org/downloads/ (We recomend to use Eclipse IDE for Java Developers edition).

To install just extract the archive into a local directory.

For proper work of the tools you need to configure Eclipse to allocate at least 512MB of memory for the heap. You can do it adding -Xmx512m parameter in the eclipse.ini file.

#### ORCC plug-in for Eclipse
To install Orcc, you can use the Eclipse Software Update Manager. To do that, 

1. Go to Help > Install New Software...
2. Click Add... to add an update site
3. Set its name (e.g. Orcc) and its URL to http://orcc.sourceforge.net/eclipse
![Add repository](https://raw.githubusercontent.com/orcc/rvccaltut/master/images/001_Eclipse_Add_repository.png)
4. Once this done, select Open RVC-CAL Compiler or Orcc.
![Installing Plug-in](https://raw.githubusercontent.com/orcc/rvccaltut/master/images/002_Eclipse_Install_plugin.png)
5. Click Next, check and accept the licenses and then click Finish.
6. At some point Eclipse will ask you if you really want to install an unverified feature, just accept and restart Eclipse.

Now you can proceed with the [Hello World example](./src/net/sf/orcc/tutorial/l00HelloWorld).

