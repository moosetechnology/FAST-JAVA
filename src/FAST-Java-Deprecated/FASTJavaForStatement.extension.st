Extension { #name : 'FASTJavaForStatement' }

{ #category : '*FAST-Java-Deprecated' }
FASTJavaForStatement >> incrementor [
	"JLS 14.14.1: the last part of the header of a for writes a list of statement
	expressions, which the model now keeps whole."

	self deprecated: 'Use incrementors instead.'.
	^ self incrementors ifEmpty: [ nil ] ifNotEmpty: [ :statements | statements first ]
]

{ #category : '*FAST-Java-Deprecated' }
FASTJavaForStatement >> incrementor: aStatement [

	self deprecated: 'Use incrementors instead.'.
	self incrementors removeAll.
	aStatement ifNil: [ ^ self ].
	self incrementors add: aStatement
]

{ #category : '*FAST-Java-Deprecated' }
FASTJavaForStatement >> initializer [
	"JLS 14.14.1: the first part of the header of a for writes a list of statement
	expressions, which the model now keeps whole."

	self deprecated: 'Use initializers instead.'.
	^ self initializers ifEmpty: [ nil ] ifNotEmpty: [ :statements | statements first ]
]

{ #category : '*FAST-Java-Deprecated' }
FASTJavaForStatement >> initializer: aStatement [

	self deprecated: 'Use initializers instead.'.
	self initializers removeAll.
	aStatement ifNil: [ ^ self ].
	self initializers add: aStatement
]
