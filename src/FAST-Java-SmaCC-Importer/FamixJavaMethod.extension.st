Extension { #name : #FamixJavaMethod }

{ #category : #'*Carrefour-FastAndBindingGenerator' }
FamixJavaMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
