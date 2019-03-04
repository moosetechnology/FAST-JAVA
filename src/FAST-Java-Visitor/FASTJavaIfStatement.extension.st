Extension { #name : #FASTJavaIfStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaIfStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaIfStatement: self
]
