Extension { #name : 'FamixJavaInvocation' }

{ #category : '*FAST-Java-SmaCC-Importer' }
FamixJavaInvocation >> generateFastIfNotDoneAndBind [

	^ self sender isInitializer
		  ifTrue: [ self sender parentType generateFastIfNotDoneAndBind ]
		  ifFalse: [ self sender generateFastIfNotDoneAndBind ]
]
