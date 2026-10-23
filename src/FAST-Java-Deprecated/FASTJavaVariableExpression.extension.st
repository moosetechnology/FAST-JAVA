Extension { #name : 'FASTJavaVariableExpression' }

{ #category : '*FAST-Java-Deprecated' }
FASTJavaVariableExpression >> javaMethodReferenceOwner [
	"A method reference now writes the receiver relation it shares with the other
	expressions that have one, so its owner is answered by `receiverOwner`, which may be
	an expression of any other kind."

	self deprecated: 'Use receiverOwner instead.'.
	^ self receiverOwner ifNotNil: [ :owner | owner isMethodReference ifTrue: [ owner ] ifFalse: [ nil ] ]
]

{ #category : '*FAST-Java-Deprecated' }
FASTJavaVariableExpression >> javaMethodReferenceOwner: aMethodReference [

	self deprecated: 'Use receiverOwner: instead.'.
	self receiverOwner: aMethodReference
]
