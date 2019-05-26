Extension { #name : #FASTJavaPrimitiveTypeExpression }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaPrimitiveTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaPrimitiveTypeExpression: self
]
