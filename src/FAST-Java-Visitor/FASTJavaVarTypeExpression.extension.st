Extension { #name : 'FASTJavaVarTypeExpression' }

{ #category : '*FAST-Java-Visitor' }
FASTJavaVarTypeExpression >> accept: aFASTJavaVisitor [
	^ aFASTJavaVisitor visitFASTJavaVarTypeExpression: self
]
