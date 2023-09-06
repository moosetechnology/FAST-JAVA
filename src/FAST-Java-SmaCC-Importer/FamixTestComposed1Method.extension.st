Extension { #name : #FamixTestComposed1Method }

{ #category : #'*Carrefour-FastAndBindingGenerator' }
FamixTestComposed1Method >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
