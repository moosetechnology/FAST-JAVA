Extension { #name : #FASTJavaVoidTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaVoidTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaVoidTypeExpression: self
]
