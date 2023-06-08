Extension { #name : #FASTJavaMultiImportDeclaration }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaMultiImportDeclaration >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaMultiImportDeclaration: self
]
