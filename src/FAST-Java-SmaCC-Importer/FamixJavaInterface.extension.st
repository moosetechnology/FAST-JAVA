Extension { #name : #FamixJavaInterface }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixJavaInterface >> generateFastAndBind [
	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		metamodel: CRFModel metamodel;
		yourself.
	self bindFastModel: fastModel usingBinder: CRFBinderVisitor new.
	^ fastModel
]

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixJavaInterface >> generateFastIfNotDoneAndBind [

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
FamixJavaInterface >> getFASTModel [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeString: self sourceAnchor sourceText
]
