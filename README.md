# FAST-JAVA

![CI](https://github.com/moosetechnology/FAST-Java/workflows/CI/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/moosetechnology/FAST-JAVA/badge.svg?branch=v2)](https://coveralls.io/github/moosetechnology/FAST-JAVA?branch=v2)
[![Moose version](https://img.shields.io/badge/Moose-9-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)

Represent the Java AST with Famix

## Installation

To load the FAST-Java project, execute in a playground

```st
Metacello new
  githubUser: 'moosetechnology' project: 'FAST-JAVA' commitish: 'v2' path: 'src';
  baseline: 'FASTJava';
  load
```

If you want to load the SmaCC importer with the model (create a FAST Java model from string)

```st
Metacello new
  githubUser: 'moosetechnology' project: 'FAST-JAVA' commitish: 'v2' path: 'src';
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

## UML

![meta-model image](https://raw.githubusercontent.com/moosetechnology/FAST-JAVA/8ceb4e8d23bda1c57a151879b7fae50cd6fdb290/fast-java.svg)
