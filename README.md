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


## UML

![meta-model image](https://raw.githubusercontent.com/moosetechnology/FAST-JAVA/8ceb4e8d23bda1c57a151879b7fae50cd6fdb290/fast-java.svg)
