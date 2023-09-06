Extension { #name : #FamixTest3Method }

{ #category : #'*Carrefour-FastAndBindingGenerator' }
FamixTest3Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
