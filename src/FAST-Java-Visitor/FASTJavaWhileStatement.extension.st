Extension { #name : #FASTJavaWhileStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaWhileStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaWhileStatement: self
]
