Extension { #name : #FamixStMethod }

{ #category : #'*Carrefour-FastAndBindingGenerator' }
FamixStMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
