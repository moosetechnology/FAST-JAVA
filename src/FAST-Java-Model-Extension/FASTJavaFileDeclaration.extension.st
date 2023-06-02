Extension { #name : #FASTJavaFileDeclaration }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaFileDeclaration >> declarationName [

	self
		deprecated: 'Use #qualifiedName instead'
		transformWith:
		'`@receiver declarationName' -> '`@receiver qualifiedName'.
	^ self qualifiedName
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaFileDeclaration >> declarationName: aName [

	self
		deprecated: 'Use #qualifiedName: instead'
		transformWith: '`@receiver declarationName: `@arg'
			-> '`@receiver qualifiedName: `@arg'.
	self qualifiedName: aName
]
