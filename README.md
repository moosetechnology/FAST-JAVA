# FAST-JAVA

[![CI](https://github.com/moosetechnology/FAST-JAVA/actions/workflows/tests.yml/badge.svg)](https://github.com/moosetechnology/FAST-JAVA/actions/workflows/tests.yml)
[![Coverage Status](https://coveralls.io/repos/github/moosetechnology/FAST-JAVA/badge.svg?branch=v4)](https://coveralls.io/github/moosetechnology/FAST-JAVA?branch=v4)
[![Moose version 12](https://img.shields.io/badge/Moose-12-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)
[![Moose version 13](https://img.shields.io/badge/Moose-13-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)

Represent the Java AST with Famix.

## Installation

To load the FAST-Java project, execute in a playground:

```st
Metacello new
  githubUser: 'moosetechnology' project: 'FAST-JAVA' commitish: 'v4' path: 'src';
  baseline: 'FASTJava';
  load
```

If you want to also load the SmaCC importer to create FAST-Java models from strings:

```st
Metacello new
  githubUser: 'moosetechnology' project: 'FAST-JAVA' commitish: 'v4' path: 'src';
  baseline: 'FASTJava';
  load: 'all'
```

## Create FAST-Java Models Using Java Source Strings

Thanks to the [SmaCC project](https://github.com/j-brant/SmaCC), it is possible to parse Java methods and classes.
The easiest way to do that is to use:

```st
JavaSmaCCProgramNodeImporterVisitor parseCodeMethodString: 'void hello() {
    // My method string
}'
```

## Full documentation

A full documentation is available on [modularmoose.org](https://modularmoose.org/users/ast/fast-java/).
