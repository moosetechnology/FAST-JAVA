Extension { #name : 'FASTJavaDimension' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaDimension >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaDimension: self
]
