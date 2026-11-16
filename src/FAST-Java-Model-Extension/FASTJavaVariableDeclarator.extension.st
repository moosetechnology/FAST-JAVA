Extension { #name : 'FASTJavaVariableDeclarator' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaVariableDeclarator >> dimensions [
	"JLS 10.2: a dimension is an entity of its own, since each pair of brackets carries
	the annotations written on it. How many of them there are is what most readers want,
	and what this answers."

	^ self brackets size
]
