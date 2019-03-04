Extension { #name : #FASTJavaLabeledCaseStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaLabeledCaseStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaLabeledCaseStatement: self
]
