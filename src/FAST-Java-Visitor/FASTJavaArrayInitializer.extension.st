Extension { #name : #FASTJavaArrayInitializer }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaArrayInitializer >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaArrayInitializer: self
]
