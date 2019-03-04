Extension { #name : #FASTJavaDoStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaDoStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaDoStatement: self
]
