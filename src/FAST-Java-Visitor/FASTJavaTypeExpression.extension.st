Extension { #name : #FASTJavaTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaTypeExpression: self
]
