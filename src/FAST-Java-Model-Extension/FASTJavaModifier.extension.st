Extension { #name : #FASTJavaModifier }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaModifier >> mooseNameOn: aStream [
	token
		ifNil: [ super mooseNameOn: aStream ]
		ifNotNil: [ aStream nextPutAll: token ]
]
