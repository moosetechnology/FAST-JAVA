Extension { #name : 'FASTJavaParameter' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaParameter >> dimensions [
	"JLS 10.2: a dimension is an entity of its own, since each pair of brackets carries
	the annotations written on it. How many of them there are is what most readers want,
	and what this answers."

	^ self brackets size
]

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaParameter >> dimensions: aNumber [
	"Write as many bare pairs of brackets as asked for, replacing the ones held. A pair
	built this way carries no annotation, which is what a caller counting dimensions
	means by one."

	self brackets removeAll.
	aNumber timesRepeat: [ self brackets add: FASTJavaDimension new ]
]
