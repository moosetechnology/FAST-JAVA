Extension { #name : 'FASTJavaDimensionExpression' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaDimensionExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaDimensionExpression: self
]
