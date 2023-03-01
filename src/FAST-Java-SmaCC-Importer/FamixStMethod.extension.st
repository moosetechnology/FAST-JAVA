Extension { #name : #FamixStMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixStMethod >> generateFastAndBind [
	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		metamodel: CRFModel metamodel;
		yourself.
	self bindFastModel: fastModel usingBinder: CRFBinderVisitor new.
	^ fastModel
]

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixStMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self generateFastAndBind 
]
