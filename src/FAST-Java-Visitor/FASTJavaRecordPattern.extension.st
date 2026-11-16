Extension { #name : 'FASTJavaRecordPattern' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaRecordPattern >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaRecordPattern: self
]
