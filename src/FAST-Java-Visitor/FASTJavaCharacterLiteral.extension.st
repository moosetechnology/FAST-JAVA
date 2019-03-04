Extension { #name : #FASTJavaCharacterLiteral }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaCharacterLiteral >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaCharacterLiteral: self
]
