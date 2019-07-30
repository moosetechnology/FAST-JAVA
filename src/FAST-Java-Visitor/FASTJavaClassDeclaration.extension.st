Extension { #name : #FASTJavaClassDeclaration }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaClassDeclaration >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaClassDeclaration: self
]
