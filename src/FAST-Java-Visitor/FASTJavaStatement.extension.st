Extension { #name : #FASTJavaStatement }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaStatement >> accept: aVisitor [
	^ aVisitor visitFASTJavaStatement: self
]
