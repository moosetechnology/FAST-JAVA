Extension { #name : #FASTScopableEntity }

{ #category : #'*FAST-Java-Model-accessing' }
FASTScopableEntity >> newClassOwner [
	"Relation named: #newClassOwner type: #FASTJavaNewClassExpression opposite: #declarations"

	<generated>
	<FMComment: 'I may be in a new class (ex. anonymous one)'>
	<container>
	<FMProperty: #newClassOwner type: #FASTJavaNewClassExpression opposite: #declarations>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #newClassOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTScopableEntity >> newClassOwner: anObject [

	<generated>
	self attributeAt: #newClassOwner put: (FMMultivalueLink on: self update: #declarations from: self newClassOwner to: anObject).
]
