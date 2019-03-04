Extension { #name : #FASTJavaNewClassExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaNewClassExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaNewClassExpression: self
]
