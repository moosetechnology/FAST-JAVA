Extension { #name : #FamixTest3Method }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTest3Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
