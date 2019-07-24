Extension { #name : #FASTJavaQualifiedTypeName }

{ #category : #'*FAST-Java-Model-Extension' }
FASTJavaQualifiedTypeName >> fullName [
	^ self namespace fullName , '.', self name
]
