"
checks completnwess of FAST-Java by
- going through a Java project,
- extracting FAST of each class,
- regenerating the source code from the FAST mode,
- reextracting a new model from the new code, and
- finally comparing the 2 models (they should be the same)
"
Class {
	#name : #FASTJavaValidator,
	#superclass : #FASTJavaVisitor,
	#category : #'FAST-Java-Tools-export'
}

{ #category : #'instance creation' }
FASTJavaValidator >> childrenNodes: astNode [

	^OrderedCollection withAll:
		(astNode children sorted: [:a :b | a startPos <= b startPos])

]

{ #category : #'instance creation' }
FASTJavaValidator >> compare: ast1 to: ast2 [

	(ast1 class = ast2 class)
		ifFalse: [ Exception signal: 'ASTs differ' ].

	(self childrenNodes: ast1)
		with: (self childrenNodes: ast2)
		do: [ :a :b | self compare: a to: b ]
]

{ #category : #'instance creation' }
FASTJavaValidator >> getAST: aFileReference [

	| model |
	aFileReference readStreamDo: [ :stream |
		self gotoClassDeclaration: stream.
		model := JavaSmaCCProgramNodeImporterVisitor new parseCodeString: stream contents
	].
	^model
]

{ #category : #'instance creation' }
FASTJavaValidator >> getRootNode: aFamixModel [

	^aFamixModel detect: [ : e | e allParents isEmpty ]
]

{ #category : #'instance creation' }
FASTJavaValidator >> gotoClassDeclaration: stream [
	"put the stream at the start of a Java class declaration"
	
	| pattern |
	pattern := 'public class '.
	(stream match: pattern)
		ifFalse: [ Exception signal: 'Class declaration not found' ].
	stream position: (stream position - pattern size)
]

{ #category : #'instance creation' }
FASTJavaValidator >> on: aDirectoryName [

	self runOnDirectory: aDirectoryName asFileReference
]

{ #category : #'instance creation' }
FASTJavaValidator >> runOnDirectory: aDirectory [

	aDirectory isDirectory
		ifFalse: [ Exception signal: aDirectory fullName , ' not a directory' ].

	aDirectory children do: [ :fileRef | self runOnFileReference: fileRef ]
]

{ #category : #'instance creation' }
FASTJavaValidator >> runOnFileReference: aFileReference [

	aFileReference isDirectory
		ifTrue: [ ^self runOnDirectory: aFileReference ].

	(aFileReference extension = 'java')
		ifTrue: [ ^self runOnJavaFile: aFileReference ].

]

{ #category : #'instance creation' }
FASTJavaValidator >> runOnJavaFile: aFileReference [

	| astOrig astBis |
	aFileReference fullName traceCr.

	astOrig := self getRootNode: (self getAST: aFileReference).
	astBis := self getRootNode:
		(JavaSmaCCProgramNodeImporterVisitor parseCodeMethodString:
			(FASTJavaExportVisitor new export: astOrig)).
	
	self compare: astOrig to: astBis
]
