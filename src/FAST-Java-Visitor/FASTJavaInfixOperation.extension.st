Extension { #name : #FASTJavaInfixOperation }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaInfixOperation >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaInfixOperation: self
]
