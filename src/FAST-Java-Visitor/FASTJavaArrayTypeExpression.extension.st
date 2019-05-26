Extension { #name : #FASTJavaArrayTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaArrayTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaArrayTypeExpression: self
]
