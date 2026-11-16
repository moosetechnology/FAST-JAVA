Extension { #name : 'FASTJavaExportsDirective' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaExportsDirective >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaExportsDirective: self
]
