Extension { #name : #FASTJavaConditionStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaConditionStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaConditionStatement: self
]
