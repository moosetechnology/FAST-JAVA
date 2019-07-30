Extension { #name : #FASTJavaAssertStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaAssertStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaAssertStatement: self
]
