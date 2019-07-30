Extension { #name : #FASTJavaNewExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaNewExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaNewExpression: self
]
