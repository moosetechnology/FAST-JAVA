Extension { #name : 'FASTJavaVariableExpression' }

{ #category : '*FAST-Java-Tools' }
FASTJavaVariableExpression >> accept: aVisitor [
	<generated>
	^ aVisitor visitFASTJavaVariableExpression: self.

]

{ #category : '*FAST-Java-Tools' }
FASTJavaVariableExpression >> activeVersion [

	^self attributeAt: #activeVersion ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Tools' }
FASTJavaVariableExpression >> activeVersion: aSSAVersion [

	^self attributeAt: #activeVersion put: aSSAVersion
]

{ #category : '*FAST-Java-Tools' }
FASTJavaVariableExpression >> ssaName [

	^self ssaVersion name

]

{ #category : '*FAST-Java-Tools' }
FASTJavaVariableExpression >> ssaVersion [

	^self attributeAt: #ssaVersion ifAbsent: [ nil ]

]

{ #category : '*FAST-Java-Tools' }
FASTJavaVariableExpression >> ssaVersion: aSSAVersion [

	self attributeAt: #ssaVersion put: aSSAVersion

]
