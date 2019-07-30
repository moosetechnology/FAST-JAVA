Extension { #name : #FASTJavaLambdaExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaLambdaExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaLambdaExpression: self
]
