Extension { #name : 'FASTJavaProvidesDirective' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaProvidesDirective >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaProvidesDirective: self
]
