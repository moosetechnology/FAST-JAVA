Extension { #name : #FamixStInvocation }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixStInvocation >> generateFastIfNotDoneAndBind [

	^ self sender isInitializer
		  ifTrue: [ self sender parentType generateFastIfNotDoneAndBind ]
		  ifFalse: [ self sender generateFastIfNotDoneAndBind ]
]
