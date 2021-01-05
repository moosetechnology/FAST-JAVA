Extension { #name : #FamixTClass }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTClass >> generateFastJava [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeString: self sourceAnchor sourceText
]
