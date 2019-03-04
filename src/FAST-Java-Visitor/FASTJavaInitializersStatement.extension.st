Extension { #name : #FASTJavaInitializersStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaInitializersStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaInitializersStatement: self
]
