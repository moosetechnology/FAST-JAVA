Extension { #name : 'FASTJavaMethodEntity' }

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> dimensions [
	"JLS 8.4: a dimension is an entity of its own, since each pair of brackets carries
	the annotations written on it. How many of them there are is what most readers want,
	and what this answers."

	^ self brackets size
]

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> sourceText [

	^ self source ifNil: [ self parentNode ifNil: [ '' ] ifNotNil: [ :parentNode | parentNode sourceText ] ]
]

{ #category : '*FAST-Java-Model-Extension' }
FASTJavaMethodEntity >> statements [
	^ self statementBlock ifNotNil: [ :existingStatementBlock | existingStatementBlock statements ] ifNil: [ OrderedCollection new ]
]
