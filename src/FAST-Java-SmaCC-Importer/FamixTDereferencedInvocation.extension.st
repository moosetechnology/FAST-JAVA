Extension { #name : #FamixTDereferencedInvocation }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTDereferencedInvocation >> generateFastIfNotDoneAndBind [

	^ self sender isInitializer
		  ifTrue: [ self sender parentType generateFastIfNotDoneAndBind ]
		  ifFalse: [ self sender generateFastIfNotDoneAndBind ]
]
