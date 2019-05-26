Extension { #name : #FASTJavaBooleanTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaBooleanTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaBooleanTypeExpression: self
]
