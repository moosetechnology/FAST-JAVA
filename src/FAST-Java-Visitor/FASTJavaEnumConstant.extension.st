Extension { #name : #FASTJavaEnumConstant }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaEnumConstant >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaEnumConstant: self
]
