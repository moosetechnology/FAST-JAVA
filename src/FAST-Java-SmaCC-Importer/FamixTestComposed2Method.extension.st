Extension { #name : #FamixTestComposed2Method }

{ #category : #'*Carrefour-FastAndBindingGenerator' }
FamixTestComposed2Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
