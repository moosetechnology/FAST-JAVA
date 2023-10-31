Extension { #name : #FASTJavaLabeledStatement }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaLabeledStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaLabeledStatement: self
]
