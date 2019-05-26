Extension { #name : #FASTJavaShortTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaShortTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaShortTypeExpression: self
]
