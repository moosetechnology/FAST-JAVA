Extension { #name : #FASTJavaModifier }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaModifier >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaModifier: self
]
