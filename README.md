# FAST-JAVA

[![CI](https://github.com/moosetechnology/FAST-JAVA/actions/workflows/tests.yml/badge.svg)](https://github.com/moosetechnology/FAST-JAVA/actions/workflows/tests.yml)

[![Coverage Status](https://coveralls.io/repos/github/moosetechnology/FAST-JAVA/badge.svg?branch=v4)](https://coveralls.io/github/moosetechnology/FAST-JAVA?branch=v4)

Supported Moose Versions: [![Moose version 12](https://img.shields.io/badge/Moose-12-%23aac9ff.svg)](https://github.com/moosetechnology/Moose) [![Moose version 13](https://img.shields.io/badge/Moose-13-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)

Represent the Java AST with Famix

## Installation

To load the FAST-Java project, execute in a playground

```st
Metacello new
  githubUser: 'moosetechnology' project: 'FAST-JAVA' commitish: 'v4' path: 'src';
  baseline: 'FASTJava';
  load
```

If you want to load the SmaCC importer with the model (create a FAST Java model from string)

```st
Metacello new
  githubUser: 'moosetechnology' project: 'FAST-JAVA' commitish: 'v4' path: 'src';
  baseline: 'FASTJava';
  load: 'all'
```

## Create a FAST-Java Model based on java string

Thanks to the [Smacc Project](https://github.com/j-brant/SmaCC) it is easy to parse Java methods and classes.
We used a visitor on the parsed java string to create a FAST-Java model.

If you need to create a FAST-Java model from a method or class, the easiest way is thus to perform:

```st
JavaSmaCCProgramNodeImporterVisitor parseCodeMethodString: 'void hello() {
    // My method string
}'
```

## Full documentation

A full documentation is available on [modularmoose.org](https://modularmoose.org/moose-wiki/Developers/Parsers/FAST-Java.html)

## UML

![meta-model image](https://raw.githubusercontent.com/moosetechnology/FAST-JAVA/v4-doc/fast-java.svg)
