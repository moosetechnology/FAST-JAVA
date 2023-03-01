Extension { #name : #FamixTest1Method }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTest1Method >> generateFastAndBind [
	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		metamodel: CRFModel metamodel;
		yourself.
	self bindFastModel: fastModel usingBinder: CRFBinderVisitor new.
	^ fastModel
]

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTest1Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self generateFastAndBind 
]
