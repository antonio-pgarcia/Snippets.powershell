# Snippets.powershell #

Code snippets in powershell

The code snippets collection are just programing exercises in functional style using multiple languages to show their similarities and limitations. The examples are intended to be simple in order to focus on how the same problem can be expressed in different languages.

## Files ##

* **ListShuffle.ps** - An implementation of ListShuffle in powershell using a functional style.
* **powershell.exe.config** - The required configuration file for using the .NET Tuple object.

## Running the examples ##

The examples requires the .NET 4 bundle. To configure **PowerShell** for use .NET just place the file **powershell.exe.config** in the directory **$PSHOME**. 

## Limitations ##

The **PowerShell** isn't a functional language and have a hardcoded call depth limitation. Thus the maximun number of recusive calls is 100 in version 1 and 1000 in version 2.
