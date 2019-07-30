Extension { #name : #FASTJavaMethodInvocation }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaMethodInvocation >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaMethodInvocation: self
]
