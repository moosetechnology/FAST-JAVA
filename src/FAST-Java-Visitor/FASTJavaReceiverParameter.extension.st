Extension { #name : 'FASTJavaReceiverParameter' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaReceiverParameter >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaReceiverParameter: self
]
