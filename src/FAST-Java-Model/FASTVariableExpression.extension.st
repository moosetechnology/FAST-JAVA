Extension { #name : #FASTVariableExpression }

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaAssignementExpressioOwner [

	<generated>
	<MSEComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>

	<MSEProperty: #javaAssignementExpressioOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaAssignementExpressioOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaAssignementExpressioOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaAssignementExpressioOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaAssignementExpressioOwner put: anObject.
	anObject variable: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaCastExpressionOwner [

	<generated>
	<MSEComment: 'The javaCastExpression owner (if possible)'>
	<container>

	<MSEProperty: #javaCastExpressionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaCastExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaCastExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaCastExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaCastExpressionOwner put: anObject.
	anObject type: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaCatchParameterOwnler [

	<generated>
	<MSEComment: 'The javaCatchPartParameterOwner owner (if possible)'>
	<container>

	<MSEProperty: #javaCatchParameterOwnler type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaCatchParameterOwnler ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaCatchParameterOwnler: anObject [

	<generated>
	(self privateState attributeAt: #javaCatchParameterOwnler ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaCatchParameterOwnler put: anObject.
	anObject parameter: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaClassPropertyOwner [

	<generated>
	<MSEComment: 'The javaClassProperty owner (if possible)'>
	<container>

	<MSEProperty: #javaClassPropertyOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaClassPropertyOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaClassPropertyOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaClassPropertyOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaClassPropertyOwner put: anObject.
	anObject type: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaForEachStatementFieldNameOwner [

	<generated>
	<MSEComment: 'The javaForEachStatement owner (if possible)'>
	<container>

	<MSEProperty: #javaForEachStatementFieldNameOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaForEachStatementFieldNameOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaForEachStatementFieldNameOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaForEachStatementFieldNameOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaForEachStatementFieldNameOwner put: anObject.
	anObject fieldname: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaForEachStatementTypeOwner [

	<generated>
	<MSEComment: 'The javaForEachStatement owner (if possible)'>
	<container>

	<MSEProperty: #javaForEachStatementTypeOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaForEachStatementTypeOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaForEachStatementTypeOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaForEachStatementTypeOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaForEachStatementTypeOwner put: anObject.
	anObject type: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaMethodInvocationArgumentsOwner [

	<generated>
	<MSEComment: 'The javaMethodInvocation owner (if possible)'>
	<container>

	<MSEProperty: #javaMethodInvocationArgumentsOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaMethodInvocationArgumentsOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaMethodInvocationArgumentsOwner: anObject [

	<generated>
	self privateState attributeAt: #javaMethodInvocationArgumentsOwner put: (FMMultivalueLink on: self update: #arguments from: self javaMethodInvocationArgumentsOwner to: anObject).
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaNewExpressionOwner [

	<generated>
	<MSEComment: 'The javaNewExpression owner (if possible)'>
	<container>

	<MSEProperty: #javaNewExpressionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaNewExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaNewExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaNewExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaNewExpressionOwner put: anObject.
	anObject type: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaOuterThisOwner [

	<generated>
	<MSEComment: 'The javaOuterThis owner (if possible)'>
	<container>

	<MSEProperty: #javaOuterThisOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaOuterThisOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaOuterThisOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaOuterThisOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaOuterThisOwner put: anObject.
	anObject type: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaVariableDeclaratorOwner [

	<generated>
	<MSEComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>

	<MSEProperty: #javaVariableDeclaratorOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaVariableDeclaratorOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaVariableDeclaratorOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaVariableDeclaratorOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaVariableDeclaratorOwner put: anObject.
	anObject variable: self
]
