Extension { #name : #FASTJavaAnnotation }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaAnnotation >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaAnnotation: self
]
