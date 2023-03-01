Extension { #name : #FamixTest1Method }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTest1Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
