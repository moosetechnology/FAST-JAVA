Extension { #name : #FASTJavaVariableExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaVariableExpression >> accept: aVisitor [
	^ aVisitor visitFASTJavaVariableExpression: self
]
