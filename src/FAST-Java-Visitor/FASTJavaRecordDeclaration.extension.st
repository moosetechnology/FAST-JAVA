Extension { #name : 'FASTJavaRecordDeclaration' }

{ #category : '*FAST-Java-Visitor-generated' }
FASTJavaRecordDeclaration >> accept: aFASTJavaVisitor [

	^ aFASTJavaVisitor visitFASTJavaRecordDeclaration: self
]
