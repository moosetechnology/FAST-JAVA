Extension { #name : #FASTJavaMethodInvocation }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaMethodInvocation >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaMethodInvocation: self
]
