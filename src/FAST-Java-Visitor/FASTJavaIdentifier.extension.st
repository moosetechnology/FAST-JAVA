Extension { #name : #FASTJavaIdentifier }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaIdentifier >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaIdentifier: self
]
