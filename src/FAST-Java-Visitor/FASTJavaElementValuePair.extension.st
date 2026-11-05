Extension { #name : 'FASTJavaElementValuePair' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaElementValuePair >> accept: aVisitor [

	^ aVisitor visitFASTJavaElementValuePair: self
]
