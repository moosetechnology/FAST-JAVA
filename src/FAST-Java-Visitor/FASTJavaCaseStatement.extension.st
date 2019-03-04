Extension { #name : #FASTJavaCaseStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaCaseStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaCaseStatement: self
]
