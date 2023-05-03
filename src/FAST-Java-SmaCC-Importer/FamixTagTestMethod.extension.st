Extension { #name : #FamixTagTestMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTagTestMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
