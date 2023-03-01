Extension { #name : #FamixTType }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTType >> getFASTModel [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeString: self sourceAnchor sourceText
]
