Extension { #name : #FASTJavaAssignmentExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaAssignmentExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaAssignmentExpression: self
]
