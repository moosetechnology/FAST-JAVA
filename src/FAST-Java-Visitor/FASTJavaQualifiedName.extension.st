Extension { #name : #FASTJavaQualifiedName }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaQualifiedName >> accept: aFASTJavaVisitor [ 
	^ aFASTJavaVisitor visitFASTJavaQualifiedName: self
]
