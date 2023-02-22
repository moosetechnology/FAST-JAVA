Extension { #name : #FASTJavaTypeParameterExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaTypeParameterExpression >> accept: aVisitor [
	^ aVisitor visitFASTJavaTypeParameter: self
]
