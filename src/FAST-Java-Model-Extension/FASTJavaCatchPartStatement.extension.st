Extension { #name : #FASTJavaCatchPartStatement }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaCatchPartStatement >> addParameter: aParameter [
	self childrenNode add: aParameter
]

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaCatchPartStatement >> parameters [
	<computed>
	<navigation: 'parameters'>
	^ self childrenNode
		select: [ :childNode | 
			{FASTVariableEntity class.
			FASTNamedEntity} includes: childNode class ]
]
