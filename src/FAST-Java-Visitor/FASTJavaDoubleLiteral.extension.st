Extension { #name : #FASTJavaDoubleLiteral }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaDoubleLiteral >> accept: aVisitor [
	^ aVisitor visitFASTJavaDoubleLiteral: self
]
