Extension { #name : #FASTJavaParameter }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaParameter >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaParameter: self
]
