Extension { #name : 'FASTJavaOpensDirective' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaOpensDirective >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaOpensDirective: self
]
