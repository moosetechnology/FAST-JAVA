Extension { #name : #FASTJavaInitializer }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaInitializer >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaInitializer: self
]
