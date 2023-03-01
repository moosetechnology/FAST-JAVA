Extension { #name : #MooseMSEImporterTestMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
MooseMSEImporterTestMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]
