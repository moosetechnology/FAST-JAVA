Extension { #name : #FamixTest7Method }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTest7Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
