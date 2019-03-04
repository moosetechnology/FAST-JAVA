Extension { #name : #FASTJavaForStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaForStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaForStatement: self
]
