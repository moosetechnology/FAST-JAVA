Extension { #name : #FASTStatementBlock }

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaInitializerOwner [
	"Relation named: #javaInitializerOwner type: #FASTJavaInitializer opposite: #statementBlock"

	<generated>
	<FMComment: 'Behavioural entity containing the statement block.'>
	<container>
	<derived>
	<FMProperty: #javaInitializerOwner type: #FASTJavaInitializer opposite: #statementBlock>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaInitializerOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaInitializerOwner: anObject [

	<generated>
	(self attributeAt: #javaInitializerOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaInitializerOwner.
		self attributeAt: #javaInitializerOwner put: anObject.
		otherSide statementBlock: nil ]
	ifNotNil: [ 
		self attributeAt: #javaInitializerOwner put: anObject.
		anObject statementBlock: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaSynchronizedStatementOwner [
	"Relation named: #javaSynchronizedStatementOwner type: #FASTJavaSynchronizedStatement opposite: #block"

	<generated>
	<FMComment: 'The owner of the synchronized block (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaSynchronizedStatementOwner type: #FASTJavaSynchronizedStatement opposite: #block>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaSynchronizedStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaSynchronizedStatementOwner: anObject [

	<generated>
	(self attributeAt: #javaSynchronizedStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaSynchronizedStatementOwner.
		self attributeAt: #javaSynchronizedStatementOwner put: anObject.
		otherSide block: nil ]
	ifNotNil: [ 
		self attributeAt: #javaSynchronizedStatementOwner put: anObject.
		anObject block: self ]
]
