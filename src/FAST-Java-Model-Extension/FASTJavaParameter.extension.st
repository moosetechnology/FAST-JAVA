Extension { #name : 'FASTJavaParameter' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaParameter >> dimensions [
	"JLS 10.2: a dimension is an entity of its own, since each pair of brackets carries
	the annotations written on it. How many of them there are is what most readers want,
	and what this answers."

	^ self brackets size
]

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaParameter >> hasVariableArguments [
	"JLS 8.4.1: a parameter has variable arity exactly when it writes an ellipsis, which the
	`ellipsis` relation holds, so there is nothing else to record."

	^ self ellipsis isNotNil
]
