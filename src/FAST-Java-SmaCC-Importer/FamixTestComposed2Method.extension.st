Extension { #name : #FamixTestComposed2Method }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTestComposed2Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
