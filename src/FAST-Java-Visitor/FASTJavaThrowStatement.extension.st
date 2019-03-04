Extension { #name : #FASTJavaThrowStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaThrowStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaThrowStatement: self
]
