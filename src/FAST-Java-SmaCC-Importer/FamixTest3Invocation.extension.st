Extension { #name : #FamixTest3Invocation }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTest3Invocation >> generateFastIfNotDoneAndBind [

	^ self sender isInitializer
		  ifTrue: [ self sender parentType generateFastIfNotDoneAndBind ]
		  ifFalse: [ self sender generateFastIfNotDoneAndBind ]
]
