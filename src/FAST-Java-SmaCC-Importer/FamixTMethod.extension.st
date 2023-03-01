Extension { #name : #FamixTMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTMethod >> generateFastIfNotDoneAndBind [
	self fast ifNotNil: [ ^ self fast mooseModel ].
	^ self bindFASTModel 
]

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTMethod >> getFASTModel [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: self sourceAnchor sourceText
]
