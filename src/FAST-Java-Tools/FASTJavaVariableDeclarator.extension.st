Extension { #name : 'FASTJavaVariableDeclarator' }

{ #category : '*FAST-Java-Tools' }
FASTJavaVariableDeclarator >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTJavaVariableDeclarator: self.

]

{ #category : '*FAST-Java-Tools' }
FASTJavaVariableDeclarator >> activeVersion [

	^self attributeAt: #activeVersion ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Tools' }
FASTJavaVariableDeclarator >> activeVersion: aSSAVersion [

	^self attributeAt: #activeVersion put: aSSAVersion
]
