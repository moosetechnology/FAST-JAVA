Extension { #name : #FamixTagTestMethod }

{ #category : #'*Carrefour-FastAndBindingGenerator' }
FamixTagTestMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
