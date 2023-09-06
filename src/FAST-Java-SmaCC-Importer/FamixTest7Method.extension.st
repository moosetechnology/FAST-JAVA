Extension { #name : #FamixTest7Method }

{ #category : #'*Carrefour-FastAndBindingGenerator' }
FamixTest7Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
