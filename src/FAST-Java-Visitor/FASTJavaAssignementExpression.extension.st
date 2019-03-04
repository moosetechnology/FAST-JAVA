Extension { #name : #FASTJavaAssignementExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaAssignementExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaAssignementExpression: self
]
