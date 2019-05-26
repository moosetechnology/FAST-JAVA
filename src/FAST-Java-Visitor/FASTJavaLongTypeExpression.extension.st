Extension { #name : #FASTJavaLongTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaLongTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaLongTypeExpression: self
]
