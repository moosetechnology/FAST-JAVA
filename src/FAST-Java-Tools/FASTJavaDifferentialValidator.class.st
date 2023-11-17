"
checks completness of FAST-Java by
- going through a Java project,
- extracting FAST of each class,
- regenerating the source code from the FAST mode,
- reextracting a new model from the new code, and
- finally comparing the 2 models (they should be the same)

This is not full-proof
- Some ASTs can be different and the code be ""the same"" for example `a&&b&&c` has different AST from `a&&(b&&c)`
- properties of nodes are nto tested, so `a==b` is considered equal to `a!=b` because the #operator is not tested

Yet it proved useful to validate FASTJava importer and exporter
"
Class {
	#name : #FASTJavaDifferentialValidator,
	#superclass : #FASTDifferentialValidator,
	#category : #'FAST-Java-Tools'
}

{ #category : #running }
FASTJavaDifferentialValidator >> acceptableAST: ast1 differentFrom: ast2 [

	^(ast1 class = FASTJavaInfixOperation) 
		or: [ ast2 class = FASTJavaInfixOperation ]
]

{ #category : #running }
FASTJavaDifferentialValidator >> getASTFromString: string [

	^ JavaSmaCCProgramNodeImporterVisitor new
		  accept: (JavaParser parse: string);
		  model
]

{ #category : #utilities }
FASTJavaDifferentialValidator >> getTopLevelNodes: model [

	^model allWithSubTypesOfAny: {
		FASTJavaClassDeclaration.
		FASTJavaInterfaceDeclaration.
		FASTJavaEnumDeclaration
	}
]

{ #category : #testing }
FASTJavaDifferentialValidator >> isSourceFile: aFileReference [

	^aFileReference extension = 'java'
]

{ #category : #utilities }
FASTJavaDifferentialValidator >> reExportAST: ast [

	^FASTJavaExportVisitor new
		export: ast
]
