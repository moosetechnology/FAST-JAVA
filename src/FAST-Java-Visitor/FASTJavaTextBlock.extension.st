Extension { #name : 'FASTJavaTextBlock' }

{ #category : '*FAST-Java-Visitor-generated' }
FASTJavaTextBlock >> accept: aFASTJavaVisitor [

	^ aFASTJavaVisitor visitFASTJavaTextBlock: self
]
