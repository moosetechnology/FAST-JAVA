Extension { #name : #MooseMSEImporterTestMethod }

{ #category : #'*Carrefour-FastAndBindingGenerator' }
MooseMSEImporterTestMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
