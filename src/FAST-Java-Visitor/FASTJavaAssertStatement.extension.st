Extension { #name : #FASTJavaAssertStatement }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaAssertStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaAssertStatement: self
]
