Extension { #name : #FASTJavaIntegerLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaIntegerLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaIntegerLiteral: self
]
