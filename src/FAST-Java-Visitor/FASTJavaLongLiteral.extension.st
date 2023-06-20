Extension { #name : #FASTJavaLongLiteral }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaLongLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaLongLiteral: self
]
