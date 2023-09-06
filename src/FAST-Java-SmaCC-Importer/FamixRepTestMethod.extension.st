Extension { #name : #FamixRepTestMethod }

{ #category : #'*Carrefour-FastAndBindingGenerator' }
FamixRepTestMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
