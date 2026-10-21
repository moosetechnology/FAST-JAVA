Extension { #name : 'FASTJavaTypeParameterExpression' }

{ #category : '*FAST-Java-Deprecated' }
FASTJavaTypeParameterExpression >> javaMethodTypeParameterOwner [

	self
		deprecated: 'Use javaTypeParameterOwner instead.'
		transformWith: '`@receiver javaMethodTypeParameterOwner' -> '`@receiver javaTypeParameterOwner'.
	^ self javaTypeParameterOwner
]

{ #category : '*FAST-Java-Deprecated' }
FASTJavaTypeParameterExpression >> javaMethodTypeParameterOwner: anOwner [

	self
		deprecated: 'Use javaTypeParameterOwner: instead.'
		transformWith: '`@receiver javaMethodTypeParameterOwner: `@argument' -> '`@receiver javaTypeParameterOwner: `@argument'.
	self javaTypeParameterOwner: anOwner
]
