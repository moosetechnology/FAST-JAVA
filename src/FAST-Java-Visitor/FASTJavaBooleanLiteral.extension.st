Extension { #name : #FASTJavaBooleanLiteral }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaBooleanLiteral >> accept: aVisitor [
	^ aVisitor visitFASTJavaBooleanLiteral: self
]
