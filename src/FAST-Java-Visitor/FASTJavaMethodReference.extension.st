Extension { #name : #FASTJavaMethodReference }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaMethodReference >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaMethodReference: self
]
