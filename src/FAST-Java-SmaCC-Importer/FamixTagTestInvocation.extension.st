Extension { #name : #FamixTagTestInvocation }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTagTestInvocation >> generateFastIfNotDoneAndBind [

	^ self sender isInitializer
		  ifTrue: [ self sender parentType generateFastIfNotDoneAndBind ]
		  ifFalse: [ self sender generateFastIfNotDoneAndBind ]
]
