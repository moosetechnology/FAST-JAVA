Extension { #name : #FASTJavaUnaryExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaUnaryExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaUnaryExpression: self
]
