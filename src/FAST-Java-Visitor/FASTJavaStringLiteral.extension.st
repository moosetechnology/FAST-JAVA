Extension { #name : #FASTJavaStringLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaStringLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaStringLiteral: self
]
