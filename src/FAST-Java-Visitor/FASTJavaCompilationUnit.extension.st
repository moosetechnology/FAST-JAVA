Extension { #name : #FASTJavaCompilationUnit }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaCompilationUnit >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaCompilationUnit: self
]
