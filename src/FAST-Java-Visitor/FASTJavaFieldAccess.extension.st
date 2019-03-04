Extension { #name : #FASTJavaFieldAccess }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaFieldAccess >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaFieldAccess: self
]
