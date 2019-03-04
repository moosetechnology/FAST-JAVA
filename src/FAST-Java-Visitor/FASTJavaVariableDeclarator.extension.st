Extension { #name : #FASTJavaVariableDeclarator }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaVariableDeclarator >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaVariableDeclarator: self
]
