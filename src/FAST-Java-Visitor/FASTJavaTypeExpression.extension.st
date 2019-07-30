Extension { #name : #FASTJavaTypeExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaTypeExpression: self
]
