Extension { #name : #FASTJavaTypeName }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaTypeName >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaTypeName: self
]
