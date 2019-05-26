Extension { #name : #FASTJavaDoubleTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaDoubleTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaDoubleTypeExpression: self
]
