Extension { #name : 'FASTJavaNewArray' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaNewArray >> dimensions [
	"JLS 15.10.1: a creation writes one pair of brackets per dimension of the array it
	makes. How many of them there are is what most readers want, and what this answers."

	^ self brackets size
]
