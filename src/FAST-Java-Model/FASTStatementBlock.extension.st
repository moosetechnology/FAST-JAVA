Extension { #name : #FASTStatementBlock }

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaInitializerOwner [
	"Relation named: #javaInitializerOwner type: #FASTJavaInitializer opposite: #statementBlock"

	<generated>
	<MSEComment: 'Behavioural entity containing the statement block.'>
	<container>
	<derived>
	<MSEProperty: #javaInitializerOwner type: #FASTJavaInitializer opposite: #statementBlock>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaInitializerOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaInitializerOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaInitializerOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaInitializerOwner.
		self privateState attributeAt: #javaInitializerOwner put: anObject.
		otherSide statementBlock: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaInitializerOwner put: anObject.
		anObject statementBlock: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaSynchronizedStatementOwner [
	"Relation named: #javaSynchronizedStatementOwner type: #FASTJavaSynchronizedStatement opposite: #block"

	<generated>
	<MSEComment: 'The owner of the synchronized block (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaSynchronizedStatementOwner type: #FASTJavaSynchronizedStatement opposite: #block>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaSynchronizedStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaSynchronizedStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaSynchronizedStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaSynchronizedStatementOwner.
		self privateState attributeAt: #javaSynchronizedStatementOwner put: anObject.
		otherSide block: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaSynchronizedStatementOwner put: anObject.
		anObject block: self ]
]
