Extension { #name : #FASTJavaEmptyDimExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaEmptyDimExpression >> accept: aVisitor [
	^ aVisitor visitFASTJavaEmptyDimExpression: self
]
