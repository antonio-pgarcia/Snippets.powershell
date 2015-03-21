# Snippets.powershell #

Code snippets in powershell

The code snippets collection are just programing exercises in functional style using multiple languages to show their similarities and limitations. The examples are intended to be simple in order to focus on how the same problem can be expressed in different languages.

## Files ##

* **ListShuffle.ps1** - An implementation of ListShuffle in powershell using a functional style.
* **NetGrasp.ps1** - A simple net comprehension cmdlet. This tool resolves all addresses from a given network.
* **powershell.exe.config** - The required configuration file for using the .NET Tuple object.

## Running the examples ##

The examples requires the .NET 4 bundle. To configure **PowerShell** for use .NET just place the file **powershell.exe.config** in the directory **$PSHOME**. 

**NetGrasp.ps1** should be invoked with network and netmaks parameters as follow **NetGrasp.ps1 192.168.1.0/24**. Valid masks are 8, 16 and 24. Bellow a sample exectution can be seen.

```

Windows PowerShell
Copyright (C) 2009 Microsoft Corporation. Reservados todos los derechos.
PS C:\usr\scripts> .\NetGrasp.ps1 192.168.1.0/24
Welcome to netgrasp
trying to grasp net: 192.168.1.0/24
[ 192.168.1.0 <-  Unassigned ]
...

```

## Limitations ##

The **PowerShell** isn't a functional language and have a hardcoded call depth limitation. Thus the maximun number of recusive calls is 100 in version 1 and 1000 in version 2.
