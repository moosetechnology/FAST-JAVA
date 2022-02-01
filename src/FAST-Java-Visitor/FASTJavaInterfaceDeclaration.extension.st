Extension { #name : #FASTJavaInterfaceDeclaration }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaInterfaceDeclaration >> accept: aFASTJavaVisitor [ 
	^ aFASTJavaVisitor visitFASTJavaInterfaceDeclaration: self
]
