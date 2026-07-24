Extension { #name : 'FASTJavaTypePattern' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaTypePattern >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaTypePattern: self
]
