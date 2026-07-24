Extension { #name : 'FASTJavaStatementBlock' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaStatementBlock >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaStatementBlock: self
]
