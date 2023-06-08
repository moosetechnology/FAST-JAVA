Extension { #name : #FASTJavaImportDeclaration }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaImportDeclaration >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaImportDeclaration: self
]
