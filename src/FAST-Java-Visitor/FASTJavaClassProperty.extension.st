Extension { #name : #FASTJavaClassProperty }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaClassProperty >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaClassProperty: self
]
