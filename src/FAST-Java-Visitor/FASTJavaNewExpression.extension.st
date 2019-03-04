Extension { #name : #FASTJavaNewExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaNewExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaNewExpression: self
]
