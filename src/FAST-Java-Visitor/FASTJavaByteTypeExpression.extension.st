Extension { #name : #FASTJavaByteTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaByteTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaByteTypeExpression: self
]
