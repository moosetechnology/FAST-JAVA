Extension { #name : #FASTJavaNewArray }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaNewArray >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaNewArray: self
]
