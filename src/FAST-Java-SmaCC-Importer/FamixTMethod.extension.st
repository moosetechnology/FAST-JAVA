Extension { #name : #FamixTMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTMethod >> getFASTModel [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: self sourceAnchor sourceText
]
