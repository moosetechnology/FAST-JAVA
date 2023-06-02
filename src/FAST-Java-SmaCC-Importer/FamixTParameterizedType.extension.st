Extension { #name : #FamixTParameterizedType }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTParameterizedType >> generateFastIfNotDoneAndBind [
	^ self parameterizableClass generateFastIfNotDoneAndBind
]
