Extension { #name : #FASTJavaFileDeclaration }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaFileDeclaration >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaFileDeclaration: self
]
