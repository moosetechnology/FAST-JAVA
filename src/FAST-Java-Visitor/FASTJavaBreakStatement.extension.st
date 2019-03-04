Extension { #name : #FASTJavaBreakStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaBreakStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaBreakStatement: self
]
