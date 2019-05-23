Extension { #name : #FASTJavaDoWhileStatement }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaDoWhileStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaDoWhileStatement: self
]
