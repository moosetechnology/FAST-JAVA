Extension { #name : #FASTJavaCharacterLiteral }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaCharacterLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaCharacterLiteral: self
]
