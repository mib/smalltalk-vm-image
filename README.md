Smalltalk VM written in C: kernel image
=======================================


Kernel
------

Package `Alpha` is a minimal kernel image for my [simple Smalltalk VM](https://github.com/mib/smalltalk-vm). It was developed in [Pharo](http://pharo.org/) and exported into an image file using a builder (see below).

Contents:

*	basic class and metaclass hierarchy
*	small integers, booleans, characters (ASCII)
*	collections and streams
*	methods and blocks (closures)
*	exceptions
*	a parser and a compiler
*	a simple `grep` utility clone developed as an example application

Basically, it only includes things necessary to run the compiler. The kernel was heavily inspired by the Pharo kernel, though everything is very simplified here. For example, `#hash` was not implemented so a `Dictionary` or the symbol table use linear lookup.


Builder
-------

Package `ASImageBuilder` contains a tool to export all classes and some basic objects into an image file loadable by the VM.