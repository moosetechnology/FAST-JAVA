Extension { #name : #FamixJavaParameterizedType }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixJavaParameterizedType >> generateFastIfNotDoneAndBind [
	^ self parameterizableClass generateFastIfNotDoneAndBind
]
