Extension { #name : 'FASTJavaReturnStatement' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaReturnStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaReturnStatement: self
]
