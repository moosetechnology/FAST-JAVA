Extension { #name : 'FASTJavaClassLiteral' }

{ #category : '*FAST-Java-Visitor-generated' }
FASTJavaClassLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaClassLiteral: self
]
