Extension { #name : #FASTJavaMethodEntity }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaMethodEntity >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaMethodEntity: self
]
