Extension { #name : #FASTExpression }

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> assertConditionOwner [
	"Relation named: #assertConditionOwner type: #FASTJavaAssertStatement opposite: #condition"

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>
	<derived>
	<MSEProperty: #assertConditionOwner type: #FASTJavaAssertStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #assertConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> assertConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #assertConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self assertConditionOwner.
		self privateState attributeAt: #assertConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #assertConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalConditionOwner [
	"Relation named: #conditionalConditionOwner type: #FASTJavaConditionalExpression opposite: #condition"

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>
	<derived>
	<MSEProperty: #conditionalConditionOwner type: #FASTJavaConditionalExpression opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #conditionalConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #conditionalConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self conditionalConditionOwner.
		self privateState attributeAt: #conditionalConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #conditionalConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalElsePartOwner [
	"Relation named: #conditionalElsePartOwner type: #FASTJavaConditionalExpression opposite: #elsePart"

	<generated>
	<MSEComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #conditionalElsePartOwner type: #FASTJavaConditionalExpression opposite: #elsePart>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #conditionalElsePartOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalElsePartOwner: anObject [

	<generated>
	(self privateState attributeAt: #conditionalElsePartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self conditionalElsePartOwner.
		self privateState attributeAt: #conditionalElsePartOwner put: anObject.
		otherSide elsePart: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #conditionalElsePartOwner put: anObject.
		anObject elsePart: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalThenPartOwner [
	"Relation named: #conditionalThenPartOwner type: #FASTJavaConditionalExpression opposite: #thenPart"

	<generated>
	<MSEComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #conditionalThenPartOwner type: #FASTJavaConditionalExpression opposite: #thenPart>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #conditionalThenPartOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> conditionalThenPartOwner: anObject [

	<generated>
	(self privateState attributeAt: #conditionalThenPartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self conditionalThenPartOwner.
		self privateState attributeAt: #conditionalThenPartOwner put: anObject.
		otherSide thenPart: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #conditionalThenPartOwner put: anObject.
		anObject thenPart: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> doConditionOwner [
	"Relation named: #doConditionOwner type: #FASTJavaDoWhileStatement opposite: #condition"

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>
	<derived>
	<MSEProperty: #doConditionOwner type: #FASTJavaDoWhileStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #doConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> doConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #doConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self doConditionOwner.
		self privateState attributeAt: #doConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #doConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> forConditionOwner [
	"Relation named: #forConditionOwner type: #FASTJavaForStatement opposite: #condition"

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>
	<derived>
	<MSEProperty: #forConditionOwner type: #FASTJavaForStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #forConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> forConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #forConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self forConditionOwner.
		self privateState attributeAt: #forConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #forConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> ifConditionOwner [
	"Relation named: #ifConditionOwner type: #FASTJavaIfStatement opposite: #condition"

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>
	<derived>
	<MSEProperty: #ifConditionOwner type: #FASTJavaIfStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #ifConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> ifConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #ifConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ifConditionOwner.
		self privateState attributeAt: #ifConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #ifConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> infixOperationLeftOperandOwner [
	"Relation named: #infixOperationLeftOperandOwner type: #FASTJavaInfixOperation opposite: #leftOperand"

	<generated>
	<MSEComment: 'The left operand (if possible)'>
	<container>
	<derived>
	<MSEProperty: #infixOperationLeftOperandOwner type: #FASTJavaInfixOperation opposite: #leftOperand>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #infixOperationLeftOperandOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> infixOperationLeftOperandOwner: anObject [

	<generated>
	(self privateState attributeAt: #infixOperationLeftOperandOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self infixOperationLeftOperandOwner.
		self privateState attributeAt: #infixOperationLeftOperandOwner put: anObject.
		otherSide leftOperand: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #infixOperationLeftOperandOwner put: anObject.
		anObject leftOperand: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> infixOperationRightOperandOwner [
	"Relation named: #infixOperationRightOperandOwner type: #FASTJavaInfixOperation opposite: #rightOperand"

	<generated>
	<MSEComment: 'The right operand (if possible)'>
	<container>
	<derived>
	<MSEProperty: #infixOperationRightOperandOwner type: #FASTJavaInfixOperation opposite: #rightOperand>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #infixOperationRightOperandOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> infixOperationRightOperandOwner: anObject [

	<generated>
	(self privateState attributeAt: #infixOperationRightOperandOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self infixOperationRightOperandOwner.
		self privateState attributeAt: #infixOperationRightOperandOwner put: anObject.
		otherSide rightOperand: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #infixOperationRightOperandOwner put: anObject.
		anObject rightOperand: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayAccessOwner [
	"Relation named: #javaArrayAccessOwner type: #FASTJavaArrayAccess opposite: #expression"

	<generated>
	<MSEComment: 'The javaArrayAccess owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaArrayAccessOwner type: #FASTJavaArrayAccess opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaArrayAccessOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayAccessOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaArrayAccessOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaArrayAccessOwner.
		self privateState attributeAt: #javaArrayAccessOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaArrayAccessOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayArrayAccessOwner [
	"Relation named: #javaArrayArrayAccessOwner type: #FASTJavaArrayAccess opposite: #array"

	<generated>
	<MSEComment: 'The javaArrayArrayAccess owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaArrayArrayAccessOwner type: #FASTJavaArrayAccess opposite: #array>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaArrayArrayAccessOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayArrayAccessOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaArrayArrayAccessOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaArrayArrayAccessOwner.
		self privateState attributeAt: #javaArrayArrayAccessOwner put: anObject.
		otherSide array: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaArrayArrayAccessOwner put: anObject.
		anObject array: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayInitializers [
	"Relation named: #javaArrayInitializers type: #FASTJavaArrayInitializer opposite: #initializers"

	<generated>
	<MSEComment: 'The owner of the expression'>
	<container>
	<MSEProperty: #javaArrayInitializers type: #FASTJavaArrayInitializer opposite: #initializers>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaArrayInitializers ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayInitializers: anObject [

	<generated>
	self privateState attributeAt: #javaArrayInitializers put: (FMMultivalueLink on: self update: #initializers from: self javaArrayInitializers to: anObject).
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayTypeNameOwner [
	"Relation named: #javaArrayTypeNameOwner type: #FASTJavaArrayTypeExpression opposite: #baseType"

	<generated>
	<MSEComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaArrayTypeNameOwner type: #FASTJavaArrayTypeExpression opposite: #baseType>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaArrayTypeNameOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaArrayTypeNameOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaArrayTypeNameOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaArrayTypeNameOwner.
		self privateState attributeAt: #javaArrayTypeNameOwner put: anObject.
		otherSide baseType: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaArrayTypeNameOwner put: anObject.
		anObject baseType: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaAssignementExpressionOwner [
	"Relation named: #javaAssignementExpressionOwner type: #FASTJavaAssignementExpression opposite: #expression"

	<generated>
	<MSEComment: 'The javaAssignementExpression owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaAssignementExpressionOwner type: #FASTJavaAssignementExpression opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaAssignementExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaAssignementExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaAssignementExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaAssignementExpressionOwner.
		self privateState attributeAt: #javaAssignementExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaAssignementExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaCastExpressionOwner [
	"Relation named: #javaCastExpressionOwner type: #FASTJavaCastExpression opposite: #expression"

	<generated>
	<MSEComment: 'The javaCastExpression owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaCastExpressionOwner type: #FASTJavaCastExpression opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaCastExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaCastExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaCastExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaCastExpressionOwner.
		self privateState attributeAt: #javaCastExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaCastExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaForEachStatementOwner [
	"Relation named: #javaForEachStatementOwner type: #FASTJavaForEachStatement opposite: #list"

	<generated>
	<MSEComment: 'The javaForEachStatement owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaForEachStatementOwner type: #FASTJavaForEachStatement opposite: #list>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaForEachStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaForEachStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaForEachStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaForEachStatementOwner.
		self privateState attributeAt: #javaForEachStatementOwner put: anObject.
		otherSide list: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaForEachStatementOwner put: anObject.
		anObject list: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaLabeledCaseStatementOwner [
	"Relation named: #javaLabeledCaseStatementOwner type: #FASTJavaLabeledCaseStatement opposite: #label"

	<generated>
	<MSEComment: 'The javaLabeledCaseStatement owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaLabeledCaseStatementOwner type: #FASTJavaLabeledCaseStatement opposite: #label>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaLabeledCaseStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaLabeledCaseStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaLabeledCaseStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaLabeledCaseStatementOwner.
		self privateState attributeAt: #javaLabeledCaseStatementOwner put: anObject.
		otherSide label: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaLabeledCaseStatementOwner put: anObject.
		anObject label: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaMethodInvocationOwner [
	"Relation named: #javaMethodInvocationOwner type: #FASTJavaMethodInvocation opposite: #receiver"

	<generated>
	<MSEComment: 'The javaMethodInvocation owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaMethodInvocationOwner type: #FASTJavaMethodInvocation opposite: #receiver>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaMethodInvocationOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaMethodInvocationOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaMethodInvocationOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaMethodInvocationOwner.
		self privateState attributeAt: #javaMethodInvocationOwner put: anObject.
		otherSide receiver: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaMethodInvocationOwner put: anObject.
		anObject receiver: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaNewArrayInitialOwner [
	"Relation named: #javaNewArrayInitialOwner type: #FASTJavaNewArray opposite: #initializer"

	<generated>
	<MSEComment: 'I belong to a new array initializations'>
	<container>
	<derived>
	<MSEProperty: #javaNewArrayInitialOwner type: #FASTJavaNewArray opposite: #initializer>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaNewArrayInitialOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaNewArrayInitialOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaNewArrayInitialOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaNewArrayInitialOwner.
		self privateState attributeAt: #javaNewArrayInitialOwner put: anObject.
		otherSide initializer: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaNewArrayInitialOwner put: anObject.
		anObject initializer: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaSynchronizedStatementOwner [
	"Relation named: #javaSynchronizedStatementOwner type: #FASTJavaSynchronizedStatement opposite: #expression"

	<generated>
	<MSEComment: 'The owner of the synchronized block (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaSynchronizedStatementOwner type: #FASTJavaSynchronizedStatement opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaSynchronizedStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaSynchronizedStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaSynchronizedStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaSynchronizedStatementOwner.
		self privateState attributeAt: #javaSynchronizedStatementOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaSynchronizedStatementOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaThrowStatementOwner [
	"Relation named: #javaThrowStatementOwner type: #FASTJavaThrowStatement opposite: #expression"

	<generated>
	<MSEComment: 'The javaThrowStatement owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaThrowStatementOwner type: #FASTJavaThrowStatement opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaThrowStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaThrowStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaThrowStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaThrowStatementOwner.
		self privateState attributeAt: #javaThrowStatementOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaThrowStatementOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaUnaryExpressionOwner [
	"Relation named: #javaUnaryExpressionOwner type: #FASTJavaUnaryExpression opposite: #expression"

	<generated>
	<MSEComment: 'The javaUnaryExpression owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaUnaryExpressionOwner type: #FASTJavaUnaryExpression opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaUnaryExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaUnaryExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaUnaryExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaUnaryExpressionOwner.
		self privateState attributeAt: #javaUnaryExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaUnaryExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaVariableDeclaratorExpressionOwner [
	"Relation named: #javaVariableDeclaratorExpressionOwner type: #FASTJavaVariableDeclarator opposite: #expression"

	<generated>
	<MSEComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaVariableDeclaratorExpressionOwner type: #FASTJavaVariableDeclarator opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaVariableDeclaratorExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> javaVariableDeclaratorExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaVariableDeclaratorExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaVariableDeclaratorExpressionOwner.
		self privateState attributeAt: #javaVariableDeclaratorExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaVariableDeclaratorExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> whileConditionOwner [
	"Relation named: #whileConditionOwner type: #FASTJavaWhileStatement opposite: #condition"

	<generated>
	<MSEComment: 'I reprensent a condition for my owner'>
	<container>
	<derived>
	<MSEProperty: #whileConditionOwner type: #FASTJavaWhileStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #whileConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTExpression >> whileConditionOwner: anObject [

	<generated>
	(self privateState attributeAt: #whileConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self whileConditionOwner.
		self privateState attributeAt: #whileConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #whileConditionOwner put: anObject.
		anObject condition: self ]
]
