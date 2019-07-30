Extension { #name : #FASTJavaPrimitiveTypeExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaPrimitiveTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaPrimitiveTypeExpression: self
]
