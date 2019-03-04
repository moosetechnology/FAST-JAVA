Extension { #name : #FASTJavaSwitchStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaSwitchStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaSwitchStatement: self
]
