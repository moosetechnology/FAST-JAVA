Extension { #name : #FamixJavaMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixJavaMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
