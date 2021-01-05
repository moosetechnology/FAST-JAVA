Extension { #name : #FamixTMethod }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTMethod >> generateFastJava [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: self sourceAnchor sourceText
]
