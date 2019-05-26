Extension { #name : #FASTJavaCharTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaCharTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaCharTypeExpression: self
]
