Extension { #name : #FASTJavaContinueStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaContinueStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaContinueStatement: self
]
