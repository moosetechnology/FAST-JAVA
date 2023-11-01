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
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'skipPaths'
	],
	#category : #'FAST-Java-Tools'
}

{ #category : #'instance creation' }
FASTJavaDifferentialValidator >> childrenNodes: astNode [

	^OrderedCollection withAll:
		(astNode children sorted: [:a :b | a startPos <= b startPos])

]

{ #category : #'instance creation' }
FASTJavaDifferentialValidator >> compare: ast1 to: ast2 [

	(ast1 class = ast2 class)
		ifFalse: [ Exception signal: 'ASTs differ' ].

	(self childrenNodes: ast1)
		with: (self childrenNodes: ast2)
		do: [ :a :b | self compare: a to: b ]
]

{ #category : #'instance creation' }
FASTJavaDifferentialValidator >> getASTFromFileReference: aFileReference [

	| model |
	aFileReference readStreamDo: [ :stream |
		model := self getASTFromString: stream ].

	^ model allWithSubTypesOfAny: {
			  FASTJavaClassDeclaration.
			  FASTJavaInterfaceDeclaration.
			  FASTJavaEnumDeclaration }
]

{ #category : #'instance creation' }
FASTJavaDifferentialValidator >> getASTFromString: stream [

	^ JavaSmaCCProgramNodeImporterVisitor new
		  accept: (JavaParser parse: stream contents);
		  model
]

{ #category : #'instance creation' }
FASTJavaDifferentialValidator >> getRootNode: aFamixModel [

	^aFamixModel detect: [ : e | e allParents isEmpty ]
]

{ #category : #'instance creation' }
FASTJavaDifferentialValidator >> gotoClassDeclaration: stream [
	"put the stream at the start of a Java class declaration"
	
	| pattern |
	pattern := 'public class '.
	(stream match: pattern)
		ifFalse: [ Exception signal: 'Class declaration not found' ].
	stream position: (stream position - pattern size)
]

{ #category : #'instance creation' }
FASTJavaDifferentialValidator >> on: aDirectoryName [

	self runOnDirectory: aDirectoryName asFileReference
]

{ #category : #'instance creation' }
FASTJavaDifferentialValidator >> runOnDirectory: aDirectory [

	aDirectory isDirectory
		ifFalse: [ Exception signal: aDirectory fullName , ' not a directory' ].

	aDirectory children do: [ :fileRef | self runOnFileReference: fileRef ]
]

{ #category : #'instance creation' }
FASTJavaDifferentialValidator >> runOnFileReference: aFileReference [

	(skipPaths includes: aFileReference fullName)
		ifTrue: [ ^self ].

	aFileReference isDirectory
		ifTrue: [ ^self runOnDirectory: aFileReference ].

	(aFileReference extension = 'java')
		ifTrue: [ ^self runOnJavaFile: aFileReference ].

]

{ #category : #'instance creation' }
FASTJavaDifferentialValidator >> runOnJavaFile: aFileReference [

	| astOrig astBis topLevelNodes |
	aFileReference fullName traceCr.

	topLevelNodes := self getASTFromFileReference: aFileReference.
	topLevelNodes ifNotEmpty: [
		astOrig := self getRootNode: topLevelNodes.
		astBis := self getRootNode:
			(self getASTFromString: (FASTJavaExportVisitor new export: astOrig)).
	
		self compare: astOrig to: astBis
	]
]

{ #category : #accessing }
FASTJavaDifferentialValidator >> skipPaths [

	^ skipPaths
]

{ #category : #accessing }
FASTJavaDifferentialValidator >> skipPaths: anObject [

	skipPaths := anObject
]
