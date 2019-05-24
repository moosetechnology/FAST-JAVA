Extension { #name : #FASTExpression }

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalConditionOwner [

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>

	<MSEProperty: #conditionalConditionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #conditionalConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #conditionalConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #conditionalConditionOwner put: anObject.
	anObject condition: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalElsePartOwner [

	<generated>
	<MSEComment: 'The if owner (if possible)'>
	<container>

	<MSEProperty: #conditionalElsePartOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #conditionalElsePartOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalElsePartOwner: anObject [

	<generated>
	(self privateState attributeAt: #conditionalElsePartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #conditionalElsePartOwner put: anObject.
	anObject elsePart: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalThenPartOwner [

	<generated>
	<MSEComment: 'The if owner (if possible)'>
	<container>

	<MSEProperty: #conditionalThenPartOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #conditionalThenPartOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalThenPartOwner: anObject [

	<generated>
	(self privateState attributeAt: #conditionalThenPartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #conditionalThenPartOwner put: anObject.
	anObject thenPart: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> doConditionOwner [

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>

	<MSEProperty: #doConditionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #doConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> doConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #doConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #doConditionOwner put: anObject.
	anObject condition: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> forConditionOwner [

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>

	<MSEProperty: #forConditionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #forConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> forConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #forConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #forConditionOwner put: anObject.
	anObject condition: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> ifConditionOwner [

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>

	<MSEProperty: #ifConditionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #ifConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> ifConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #ifConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #ifConditionOwner put: anObject.
	anObject condition: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> infixOperationLeftOperandOwner [

	<generated>
	<MSEComment: 'The left operand (if possible)'>
	<container>

	<MSEProperty: #infixOperationLeftOperandOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #infixOperationLeftOperandOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> infixOperationLeftOperandOwner: anObject [

	<generated>
	(self privateState attributeAt: #infixOperationLeftOperandOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #infixOperationLeftOperandOwner put: anObject.
	anObject leftOperand: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> infixOperationRightOperandOwner [

	<generated>
	<MSEComment: 'The right operand (if possible)'>
	<container>

	<MSEProperty: #infixOperationRightOperandOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #infixOperationRightOperandOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> infixOperationRightOperandOwner: anObject [

	<generated>
	(self privateState attributeAt: #infixOperationRightOperandOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #infixOperationRightOperandOwner put: anObject.
	anObject rightOperand: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayAccessOwner [

	<generated>
	<MSEComment: 'The javaArrayAccess owner (if possible)'>
	<container>

	<MSEProperty: #javaArrayAccessOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaArrayAccessOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayAccessOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaArrayAccessOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaArrayAccessOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayArrayAccessOwner [

	<generated>
	<MSEComment: 'The javaArrayArrayAccess owner (if possible)'>
	<container>

	<MSEProperty: #javaArrayArrayAccessOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaArrayArrayAccessOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayArrayAccessOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaArrayArrayAccessOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaArrayArrayAccessOwner put: anObject.
	anObject array: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayInitializers [

	<generated>
	<MSEComment: 'The owner of the expression'>
	<container>

	<MSEProperty: #javaArrayInitializers type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaArrayInitializers ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayInitializers: anObject [

	<generated>
	self privateState attributeAt: #javaArrayInitializers put: (FMMultivalueLink on: self update: #initializers from: self javaArrayInitializers to: anObject).
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaAssignementExpressioOwner [

	<generated>
	<MSEComment: 'The javaAssignementExpression owner (if possible)'>
	<container>

	<MSEProperty: #javaAssignementExpressioOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaAssignementExpressioOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaAssignementExpressioOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaAssignementExpressioOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaAssignementExpressioOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaCastExpressionExpressionOwner [

	<generated>
	<MSEComment: 'The javaCastExpression owner (if possible)'>
	<container>

	<MSEProperty: #javaCastExpressionExpressionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaCastExpressionExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaCastExpressionExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaCastExpressionExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaCastExpressionExpressionOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaCastExpressionOwner [

	<generated>
	<MSEComment: 'The javaCastExpression owner (if possible)'>
	<container>

	<MSEProperty: #javaCastExpressionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaCastExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaCastExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaCastExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaCastExpressionOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaForEachStatementOwner [

	<generated>
	<MSEComment: 'The javaForEachStatement owner (if possible)'>
	<container>

	<MSEProperty: #javaForEachStatementOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaForEachStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaForEachStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaForEachStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaForEachStatementOwner put: anObject.
	anObject list: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaLabeledCaseStatementOwner [

	<generated>
	<MSEComment: 'The javaLabeledCaseStatement owner (if possible)'>
	<container>

	<MSEProperty: #javaLabeledCaseStatementOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaLabeledCaseStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaLabeledCaseStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaLabeledCaseStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaLabeledCaseStatementOwner put: anObject.
	anObject label: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaLambdaExpressioOwner [

	<generated>
	<MSEComment: 'The javaLambdaExpression owner (if possible)'>
	<container>

	<MSEProperty: #javaLambdaExpressioOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaLambdaExpressioOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaLambdaExpressioOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaLambdaExpressioOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaLambdaExpressioOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaLambdaExpressionOwner [

	<generated>
	<MSEComment: 'The expression owner (if possible)'>
	<container>

	<MSEProperty: #javaLambdaExpressionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaLambdaExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaLambdaExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaLambdaExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaLambdaExpressionOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaMethodInvocationArgumentsOwner [

	<generated>
	<MSEComment: 'The javaMethodInvocation owner (if possible)'>
	<container>

	<MSEProperty: #javaMethodInvocationArgumentsOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaMethodInvocationArgumentsOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaMethodInvocationArgumentsOwner: anObject [

	<generated>
	self privateState attributeAt: #javaMethodInvocationArgumentsOwner put: (FMMultivalueLink on: self update: #arguments from: self javaMethodInvocationArgumentsOwner to: anObject).
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaMethodInvocationOwner [

	<generated>
	<MSEComment: 'The javaMethodInvocation owner (if possible)'>
	<container>

	<MSEProperty: #javaMethodInvocationOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaMethodInvocationOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaMethodInvocationOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaMethodInvocationOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaMethodInvocationOwner put: anObject.
	anObject receiver: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaNewArrayInitialOwner [

	<generated>
	<MSEComment: 'I belong to a new array initializations'>
	<container>

	<MSEProperty: #javaNewArrayInitialOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaNewArrayInitialOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaNewArrayInitialOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaNewArrayInitialOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaNewArrayInitialOwner put: anObject.
	anObject initializer: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaNewExpressionArgumentsOwner [

	<generated>
	<MSEComment: 'The javaNewExpression owner (if possible)'>
	<container>

	<MSEProperty: #javaNewExpressionArgumentsOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaNewExpressionArgumentsOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaNewExpressionArgumentsOwner: anObject [

	<generated>
	self privateState attributeAt: #javaNewExpressionArgumentsOwner put: (FMMultivalueLink on: self update: #arguments from: self javaNewExpressionArgumentsOwner to: anObject).
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaSynchronizedStatementOwner [

	<generated>
	<MSEComment: 'The owner of the synchronized block (if possible)'>
	<container>

	<MSEProperty: #javaSynchronizedStatementOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaSynchronizedStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaSynchronizedStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaSynchronizedStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaSynchronizedStatementOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaThrowStatementOwner [

	<generated>
	<MSEComment: 'The javaThrowStatement owner (if possible)'>
	<container>

	<MSEProperty: #javaThrowStatementOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaThrowStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaThrowStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaThrowStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaThrowStatementOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaUnaryExpressionOwner [

	<generated>
	<MSEComment: 'The javaUnaryExpression owner (if possible)'>
	<container>

	<MSEProperty: #javaUnaryExpressionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaUnaryExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaUnaryExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaUnaryExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaUnaryExpressionOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaVariableDeclaratorExpressionOwner [

	<generated>
	<MSEComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>

	<MSEProperty: #javaVariableDeclaratorExpressionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaVariableDeclaratorExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaVariableDeclaratorExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaVariableDeclaratorExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaVariableDeclaratorExpressionOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaVariableDeclaratorOwner [

	<generated>
	<MSEComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>

	<MSEProperty: #javaVariableDeclaratorOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaVariableDeclaratorOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaVariableDeclaratorOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaVariableDeclaratorOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaVariableDeclaratorOwner put: anObject.
	anObject expression: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> whileConditionOwner [

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>

	<MSEProperty: #whileConditionOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #whileConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> whileConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #whileConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #whileConditionOwner put: anObject.
	anObject condition: self
]
