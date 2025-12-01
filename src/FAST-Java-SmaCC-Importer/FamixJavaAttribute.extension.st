Extension { #name : 'FamixJavaAttribute' }

{ #category : '*FAST-Java-SmaCC-Importer' }
FamixJavaAttribute >> getFAST [
	"Attributes sourceAnchor encompass the name of the attribute and a possible initialization
	This can be parsed as an expression (JavaSmaCCProgramNodeImporterVisitor >> parseCodeExpressionString:)
	"

	^JavaSmaCCProgramNodeImporterVisitor new
		getExpressionAST: self sourceAnchor sourceText
]
