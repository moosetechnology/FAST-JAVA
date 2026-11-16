Extension { #name : 'FASTJavaModuleDirective' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaModuleDirective >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaModuleDirective: self
]
