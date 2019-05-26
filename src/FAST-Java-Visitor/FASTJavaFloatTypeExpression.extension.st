Extension { #name : #FASTJavaFloatTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaFloatTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaFloatTypeExpression: self
]
