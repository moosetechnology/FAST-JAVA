Extension { #name : 'FASTJavaSwitchRule' }

{ #category : '*FAST-Java-Deprecated' }
FASTJavaSwitchRule >> switchExpressionOwner [

	self deprecated: 'Use switchOwner instead.' transformWith: '`@receiver switchExpressionOwner' -> '`@receiver switchOwner'.
	^ self switchOwner
]

{ #category : '*FAST-Java-Deprecated' }
FASTJavaSwitchRule >> switchExpressionOwner: anOwner [

	self
		deprecated: 'Use switchOwner: instead.'
		transformWith: '`@receiver switchExpressionOwner: `@argument' -> '`@receiver switchOwner: `@argument'.
	self switchOwner: anOwner
]
