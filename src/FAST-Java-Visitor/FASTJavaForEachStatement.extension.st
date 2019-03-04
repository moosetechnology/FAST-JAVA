Extension { #name : #FASTJavaForEachStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaForEachStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaForEachStatement: self
]
