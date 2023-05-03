Extension { #name : #FamixRepTestMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixRepTestMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
