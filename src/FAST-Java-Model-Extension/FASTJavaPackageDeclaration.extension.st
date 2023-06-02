Extension { #name : #FASTJavaPackageDeclaration }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaPackageDeclaration >> declarationName [

	self
		deprecated: 'Use #qualifiedName instead'
		transformWith:
		'`@receiver declarationName' -> '`@receiver qualifiedName'.
	^ self qualifiedName
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaPackageDeclaration >> declarationName: aName [

	self
		deprecated: 'Use #qualifiedName: instead'
		transformWith: '`@receiver declarationName: `@arg'
			-> '`@receiver qualifiedName: `@arg'.
	self qualifiedName: aName
]
