Extension { #name : #FamixTestComposed1Method }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTestComposed1Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
