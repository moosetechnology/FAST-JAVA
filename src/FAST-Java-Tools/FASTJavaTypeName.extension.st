Extension { #name : 'FASTJavaTypeName' }

{ #category : '*FAST-Java-Tools' }
FASTJavaTypeName >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTJavaTypeName: self.

]
