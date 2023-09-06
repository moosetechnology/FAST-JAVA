Extension { #name : #FamixTest1Method }

{ #category : #'*Carrefour-FastAndBindingGenerator' }
FamixTest1Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
