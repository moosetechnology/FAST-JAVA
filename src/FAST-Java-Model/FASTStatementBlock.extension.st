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
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaInitializerOwner.
		self privateState attributeAt: #javaInitializerOwner put: anObject.
		otherSide statementBlock: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaInitializerOwner put: anObject.
		anObject statementBlock: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaLambdaExpressionOwner [

	<generated>
	<MSEComment: 'The statementBlock owner (if possible)'>
	<container>

	<MSEProperty: #javaLambdaExpressionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaLambdaExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaLambdaExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaLambdaExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaLambdaExpressionOwner.
		self privateState attributeAt: #javaLambdaExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaLambdaExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatementBlock >> javaSynchronizedStatementOwner [

	<generated>
	<MSEComment: 'The owner of the synchronized block (if possible)'>
	<container>

	<MSEProperty: #javaSynchronizedStatementOwner type: #Object>
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
