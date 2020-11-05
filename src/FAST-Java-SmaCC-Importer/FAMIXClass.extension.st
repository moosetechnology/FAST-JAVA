Extension { #name : #FAMIXClass }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FAMIXClass >> generateFastJava [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeString: self sourceAnchor sourceText
]
