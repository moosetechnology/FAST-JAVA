Extension { #name : 'FASTJavaMatchAllPattern' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaMatchAllPattern >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaMatchAllPattern: self
]
