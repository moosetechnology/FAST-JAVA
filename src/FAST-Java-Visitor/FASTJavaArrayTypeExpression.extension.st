Extension { #name : #FASTJavaArrayTypeExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaArrayTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaArrayTypeExpression: self
]
