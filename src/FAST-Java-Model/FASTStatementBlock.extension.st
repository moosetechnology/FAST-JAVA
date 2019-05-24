Extension { #name : #FASTStatementBlock }

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaInitializerOwner [

	<generated>
	<MSEComment: 'Behavioural entity containing the statement block.'>
	<container>

	<MSEProperty: #javaInitializerOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaInitializerOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaInitializerOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaInitializerOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaInitializerOwner put: anObject.
	anObject statementBlock: self
]