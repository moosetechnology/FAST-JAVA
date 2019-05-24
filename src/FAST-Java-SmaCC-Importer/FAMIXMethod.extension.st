Extension { #name : #FAMIXMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FAMIXMethod >> generateFastJava [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: self sourceAnchor sourceText
]
