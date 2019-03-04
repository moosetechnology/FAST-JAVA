Extension { #name : #FASTJavaBodyStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaBodyStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaBodyStatement: self
]
