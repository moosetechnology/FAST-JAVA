Extension { #name : #FASTJavaClassTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaClassTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaClassTypeExpression: self
]
