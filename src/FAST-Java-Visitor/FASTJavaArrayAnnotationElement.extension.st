Extension { #name : #FASTJavaArrayAnnotationElement }

{ #category : #'*FAST-Java-Visitor' }
FASTJavaArrayAnnotationElement >> accept: aVisitor [
	^ aVisitor visitFASTJavaArrayAnnotationElement: self
]
