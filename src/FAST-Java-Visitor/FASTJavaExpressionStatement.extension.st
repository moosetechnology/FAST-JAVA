Extension { #name : 'FASTJavaExpressionStatement' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaExpressionStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaExpressionStatement: self
]
