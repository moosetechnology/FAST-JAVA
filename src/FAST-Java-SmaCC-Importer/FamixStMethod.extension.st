Extension { #name : #FamixStMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixStMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
