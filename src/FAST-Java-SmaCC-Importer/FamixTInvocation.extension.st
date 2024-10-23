Extension { #name : 'FamixTInvocation' }

{ #category : '*FAST-Java-SmaCC-Importer' }
FamixTInvocation >> generateFastIfNotDoneAndBind [

	^ self sender isInitializer
		  ifTrue: [ self sender parentType generateFastIfNotDoneAndBind ]
		  ifFalse: [ self sender generateFastIfNotDoneAndBind ]
]
