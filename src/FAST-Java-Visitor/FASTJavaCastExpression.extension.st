Extension { #name : #FASTJavaCastExpression }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaCastExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaCastExpression: self
]
