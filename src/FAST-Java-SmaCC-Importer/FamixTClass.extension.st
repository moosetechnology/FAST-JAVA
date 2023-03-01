Extension { #name : #FamixTClass }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTClass >> generateFastAndBind [
	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		metamodel: CRFModel metamodel;
		yourself.
	self bindFastModel: fastModel usingBinder: CRFBinderVisitor new.
	^ fastModel
]

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTClass >> generateFastIfNotDoneAndBind [

	self fastDeclaration ifNotEmpty: [ 
		^ self fastDeclaration anyOne mooseModel ].
	self fastTypeDefinition ifNotNil: [ 
		^ self fastTypeDefinition mooseModel ].
	^ self isAnonymousClass
		  ifFalse: [ self generateFastAndBind ]
		  ifTrue: [ 
			  ((self
				    allAtScope: FamixTClass
				    until: [ :c | 
				    (c isKindOf: FamixJavaClass) and: [ c isAnonymousClass not ] ])
				   asOrderedCollection \ { self }) anyOne generateFastAndBind ]
]

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTClass >> getFASTModel [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeString: self sourceAnchor sourceText
]
