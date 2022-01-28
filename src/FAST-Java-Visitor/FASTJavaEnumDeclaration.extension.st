Extension { #name : #FASTJavaEnumDeclaration }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaEnumDeclaration >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaEnumDeclaration: self
]
