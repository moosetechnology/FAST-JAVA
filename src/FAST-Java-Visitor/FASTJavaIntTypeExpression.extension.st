Extension { #name : #FASTJavaIntTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaIntTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaIntTypeExpression: self
]
