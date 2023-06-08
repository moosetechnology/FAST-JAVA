Extension { #name : #FASTJavaPackageDeclaration }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaPackageDeclaration >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaPackageDeclaration: self
]
