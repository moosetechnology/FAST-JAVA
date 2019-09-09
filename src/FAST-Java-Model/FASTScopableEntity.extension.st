Extension { #name : #FASTScopableEntity }

{ #category : #'*FAST-Java-Model-accessing' }
FASTScopableEntity >> newClassOwner [
	"Relation named: #newClassOwner type: #FASTNewClassExpression opposite: #declarations"

	<generated>
	<MSEComment: 'I may be in a new class (ex. anonymous one)'>
	<container>
	<MSEProperty: #newClassOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #newClassOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTScopableEntity >> newClassOwner: anObject [

	<generated>
	self privateState attributeAt: #newClassOwner put: (FMMultivalueLink on: self update: #declarations from: self newClassOwner to: anObject).
]
