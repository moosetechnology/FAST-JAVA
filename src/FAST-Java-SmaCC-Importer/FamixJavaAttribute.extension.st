Extension { #name : 'FamixJavaAttribute' }

{ #category : '*FAST-Java-SmaCC-Importer' }
FamixJavaAttribute >> getFAST [
	"Attributes sourceAnchor encompass the name of the attribute and a possible initialization
	This can be parsed as an expression (JavaSmaCCProgramNodeImporterVisitor >> parseCodeExpressionString:)
	For this to work properly, the Java importer must be set as being on a Class declaration
	then `clone` will create a sub-parser for the expression"

	^(JavaSmaCCProgramNodeImporterVisitor new
		currentFASTEntity: (FASTJavaClassDeclaration new) ;
		clone) 
		parseCodeExpressionString: self sourceAnchor sourceText
]
