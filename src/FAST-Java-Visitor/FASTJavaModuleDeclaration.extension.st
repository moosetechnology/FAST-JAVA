Extension { #name : 'FASTJavaModuleDeclaration' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaModuleDeclaration >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaModuleDeclaration: self
]
