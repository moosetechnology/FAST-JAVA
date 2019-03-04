Extension { #name : #FASTJavaCatchPartStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaCatchPartStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaCatchPartStatement: self
]
