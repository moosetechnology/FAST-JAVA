Extension { #name : #FASTJavaVarDeclStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaVarDeclStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaVarDeclStatement: self
]
