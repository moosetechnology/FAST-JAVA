Extension { #name : 'FASTJavaRequiresDirective' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaRequiresDirective >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaRequiresDirective: self
]
