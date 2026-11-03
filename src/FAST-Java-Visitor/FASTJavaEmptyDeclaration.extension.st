Extension { #name : 'FASTJavaEmptyDeclaration' }

{ #category : '*FAST-Java-Visitor-generated' }
FASTJavaEmptyDeclaration >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaEmptyDeclaration: self
]
