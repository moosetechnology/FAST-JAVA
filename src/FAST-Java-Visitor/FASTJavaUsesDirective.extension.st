Extension { #name : 'FASTJavaUsesDirective' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaUsesDirective >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaUsesDirective: self
]
