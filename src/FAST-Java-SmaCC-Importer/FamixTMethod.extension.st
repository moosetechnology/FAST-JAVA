Extension { #name : #FamixTMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTMethod >> bindFASTModel [
	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		metamodel: CRFModel metamodel;
		yourself.
	self bindFastModel: fastModel usingBinder: CRFBinderVisitor new.
	^ fastModel
]

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTMethod >> getFASTModel [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: self sourceAnchor sourceText
]
