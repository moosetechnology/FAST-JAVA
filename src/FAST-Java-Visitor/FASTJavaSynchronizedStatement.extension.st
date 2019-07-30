Extension { #name : #FASTJavaSynchronizedStatement }

{ #category : #'*FAST-Java-Visitor-generated' }
FASTJavaSynchronizedStatement >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaSynchronizedStatement: self
]
