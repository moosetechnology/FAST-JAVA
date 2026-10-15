Extension { #name : 'FASTTExpression' }

{ #category : '*FAST-Java-Model' }
FASTTExpression >> assertConditionOwner [
	"Relation named: #assertConditionOwner type: #FASTJavaAssertStatement opposite: #condition"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'I represent a condition for my owner'>
	<container>
	<derived>
	<FMProperty: #assertConditionOwner type: #FASTJavaAssertStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #assertConditionOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> assertConditionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #assertConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self assertConditionOwner.
		self attributeAt: #assertConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #assertConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> conditionalConditionOwner [
	"Relation named: #conditionalConditionOwner type: #FASTJavaConditionalExpression opposite: #condition"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'I represent a condition for my owner'>
	<container>
	<derived>
	<FMProperty: #conditionalConditionOwner type: #FASTJavaConditionalExpression opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #conditionalConditionOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> conditionalConditionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #conditionalConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self conditionalConditionOwner.
		self attributeAt: #conditionalConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #conditionalConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> conditionalElsePartOwner [
	"Relation named: #conditionalElsePartOwner type: #FASTJavaConditionalExpression opposite: #elsePart"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #conditionalElsePartOwner type: #FASTJavaConditionalExpression opposite: #elsePart>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #conditionalElsePartOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> conditionalElsePartOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #conditionalElsePartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self conditionalElsePartOwner.
		self attributeAt: #conditionalElsePartOwner put: anObject.
		otherSide elsePart: nil ]
	ifNotNil: [ 
		self attributeAt: #conditionalElsePartOwner put: anObject.
		anObject elsePart: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> conditionalThenPartOwner [
	"Relation named: #conditionalThenPartOwner type: #FASTJavaConditionalExpression opposite: #thenPart"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #conditionalThenPartOwner type: #FASTJavaConditionalExpression opposite: #thenPart>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #conditionalThenPartOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> conditionalThenPartOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #conditionalThenPartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self conditionalThenPartOwner.
		self attributeAt: #conditionalThenPartOwner put: anObject.
		otherSide thenPart: nil ]
	ifNotNil: [ 
		self attributeAt: #conditionalThenPartOwner put: anObject.
		anObject thenPart: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> infixOperationLeftOperandOwner [
	"Relation named: #infixOperationLeftOperandOwner type: #FASTJavaInfixOperation opposite: #leftOperand"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The left operand (if possible)'>
	<container>
	<derived>
	<FMProperty: #infixOperationLeftOperandOwner type: #FASTJavaInfixOperation opposite: #leftOperand>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #infixOperationLeftOperandOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> infixOperationLeftOperandOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #infixOperationLeftOperandOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self infixOperationLeftOperandOwner.
		self attributeAt: #infixOperationLeftOperandOwner put: anObject.
		otherSide leftOperand: nil ]
	ifNotNil: [ 
		self attributeAt: #infixOperationLeftOperandOwner put: anObject.
		anObject leftOperand: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> infixOperationRightOperandOwner [
	"Relation named: #infixOperationRightOperandOwner type: #FASTJavaInfixOperation opposite: #rightOperand"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The right operand (if possible)'>
	<container>
	<derived>
	<FMProperty: #infixOperationRightOperandOwner type: #FASTJavaInfixOperation opposite: #rightOperand>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #infixOperationRightOperandOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> infixOperationRightOperandOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #infixOperationRightOperandOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self infixOperationRightOperandOwner.
		self attributeAt: #infixOperationRightOperandOwner put: anObject.
		otherSide rightOperand: nil ]
	ifNotNil: [ 
		self attributeAt: #infixOperationRightOperandOwner put: anObject.
		anObject rightOperand: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaArrayAccessOwner [
	"Relation named: #javaArrayAccessOwner type: #FASTJavaArrayAccess opposite: #expression"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaArrayAccess owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaArrayAccessOwner type: #FASTJavaArrayAccess opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaArrayAccessOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaArrayAccessOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaArrayAccessOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaArrayAccessOwner.
		self attributeAt: #javaArrayAccessOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaArrayAccessOwner put: anObject.
		anObject expression: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaArrayArrayAccessOwner [
	"Relation named: #javaArrayArrayAccessOwner type: #FASTJavaArrayAccess opposite: #array"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaArrayArrayAccess owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaArrayArrayAccessOwner type: #FASTJavaArrayAccess opposite: #array>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaArrayArrayAccessOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaArrayArrayAccessOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaArrayArrayAccessOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaArrayArrayAccessOwner.
		self attributeAt: #javaArrayArrayAccessOwner put: anObject.
		otherSide array: nil ]
	ifNotNil: [ 
		self attributeAt: #javaArrayArrayAccessOwner put: anObject.
		anObject array: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaArrayInitializers [
	"Relation named: #javaArrayInitializers type: #FASTJavaArrayInitializer opposite: #initializers"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The owner of the expression'>
	<container>
	<FMProperty: #javaArrayInitializers type: #FASTJavaArrayInitializer opposite: #initializers>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaArrayInitializers ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaArrayInitializers: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	self attributeAt: #javaArrayInitializers put: (FMMultivalueLink on: self update: #initializers from: self javaArrayInitializers to: anObject).
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaArrayTypeNameOwner [
	"Relation named: #javaArrayTypeNameOwner type: #FASTJavaArrayTypeExpression opposite: #baseType"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaArrayTypeNameOwner type: #FASTJavaArrayTypeExpression opposite: #baseType>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaArrayTypeNameOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaArrayTypeNameOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaArrayTypeNameOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaArrayTypeNameOwner.
		self attributeAt: #javaArrayTypeNameOwner put: anObject.
		otherSide baseType: nil ]
	ifNotNil: [ 
		self attributeAt: #javaArrayTypeNameOwner put: anObject.
		anObject baseType: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaAssignmentExpressionOwner [
	"Relation named: #javaAssignmentExpressionOwner type: #FASTJavaAssignmentExpression opposite: #expression"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaAssignmentExpression owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaAssignmentExpressionOwner type: #FASTJavaAssignmentExpression opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaAssignmentExpressionOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaAssignmentExpressionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaAssignmentExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaAssignmentExpressionOwner.
		self attributeAt: #javaAssignmentExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaAssignmentExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaCastExpressionOwner [
	"Relation named: #javaCastExpressionOwner type: #FASTJavaCastExpression opposite: #expression"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaCastExpression owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaCastExpressionOwner type: #FASTJavaCastExpression opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaCastExpressionOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaCastExpressionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaCastExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaCastExpressionOwner.
		self attributeAt: #javaCastExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaCastExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaForEachStatementOwner [
	"Relation named: #javaForEachStatementOwner type: #FASTJavaForEachStatement opposite: #list"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaForEachStatement owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaForEachStatementOwner type: #FASTJavaForEachStatement opposite: #list>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaForEachStatementOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaForEachStatementOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaForEachStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaForEachStatementOwner.
		self attributeAt: #javaForEachStatementOwner put: anObject.
		otherSide list: nil ]
	ifNotNil: [ 
		self attributeAt: #javaForEachStatementOwner put: anObject.
		anObject list: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaNewArrayInitialOwner [
	"Relation named: #javaNewArrayInitialOwner type: #FASTJavaNewArray opposite: #initializer"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'I belong to a new array initialization'>
	<container>
	<derived>
	<FMProperty: #javaNewArrayInitialOwner type: #FASTJavaNewArray opposite: #initializer>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaNewArrayInitialOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaNewArrayInitialOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaNewArrayInitialOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaNewArrayInitialOwner.
		self attributeAt: #javaNewArrayInitialOwner put: anObject.
		otherSide initializer: nil ]
	ifNotNil: [ 
		self attributeAt: #javaNewArrayInitialOwner put: anObject.
		anObject initializer: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaStringAssertStatementOwner [
	"Relation named: #javaStringAssertStatementOwner type: #FASTJavaAssertStatement opposite: #message"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The assertion which I describe'>
	<container>
	<derived>
	<FMProperty: #javaStringAssertStatementOwner type: #FASTJavaAssertStatement opposite: #message>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaStringAssertStatementOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaStringAssertStatementOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaStringAssertStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaStringAssertStatementOwner.
		self attributeAt: #javaStringAssertStatementOwner put: anObject.
		otherSide message: nil ]
	ifNotNil: [ 
		self attributeAt: #javaStringAssertStatementOwner put: anObject.
		anObject message: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaSynchronizedStatementOwner [
	"Relation named: #javaSynchronizedStatementOwner type: #FASTJavaSynchronizedStatement opposite: #expression"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The owner of the synchronized block (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaSynchronizedStatementOwner type: #FASTJavaSynchronizedStatement opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaSynchronizedStatementOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaSynchronizedStatementOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaSynchronizedStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaSynchronizedStatementOwner.
		self attributeAt: #javaSynchronizedStatementOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaSynchronizedStatementOwner put: anObject.
		anObject expression: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaThrowStatementOwner [
	"Relation named: #javaThrowStatementOwner type: #FASTJavaThrowStatement opposite: #expression"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaThrowStatement owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaThrowStatementOwner type: #FASTJavaThrowStatement opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaThrowStatementOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaThrowStatementOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaThrowStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaThrowStatementOwner.
		self attributeAt: #javaThrowStatementOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaThrowStatementOwner put: anObject.
		anObject expression: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaUnaryExpressionOwner [
	"Relation named: #javaUnaryExpressionOwner type: #FASTJavaUnaryExpression opposite: #expression"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaUnaryExpression owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaUnaryExpressionOwner type: #FASTJavaUnaryExpression opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaUnaryExpressionOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaUnaryExpressionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaUnaryExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaUnaryExpressionOwner.
		self attributeAt: #javaUnaryExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaUnaryExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaVariableDeclaratorExpressionOwner [
	"Relation named: #javaVariableDeclaratorExpressionOwner type: #FASTJavaVariableDeclarator opposite: #expression"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaVariableDeclaratorExpressionOwner type: #FASTJavaVariableDeclarator opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaVariableDeclaratorExpressionOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> javaVariableDeclaratorExpressionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #javaVariableDeclaratorExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaVariableDeclaratorExpressionOwner.
		self attributeAt: #javaVariableDeclaratorExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaVariableDeclaratorExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> switchConditionOwner [
	"Relation named: #switchConditionOwner type: #FASTJavaSwitchStatement opposite: #condition"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'I represent a condition for my owner'>
	<container>
	<derived>
	<FMProperty: #switchConditionOwner type: #FASTJavaSwitchStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #switchConditionOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> switchConditionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #switchConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self switchConditionOwner.
		self attributeAt: #switchConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #switchConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> switchExpressionConditionOwner [
	"Relation named: #switchExpressionConditionOwner type: #FASTJavaSwitchExpression opposite: #condition"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The switch expression whose condition I am'>
	<container>
	<derived>
	<FMProperty: #switchExpressionConditionOwner type: #FASTJavaSwitchExpression opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #switchExpressionConditionOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> switchExpressionConditionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #switchExpressionConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self switchExpressionConditionOwner.
		self attributeAt: #switchExpressionConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #switchExpressionConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> switchLabelOwner [
	"Relation named: #switchLabelOwner type: #FASTJavaSwitchLabel opposite: #caseExpressions"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The switch label that owns me'>
	<container>
	<FMProperty: #switchLabelOwner type: #FASTJavaSwitchLabel opposite: #caseExpressions>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #switchLabelOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> switchLabelOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	self attributeAt: #switchLabelOwner put: (FMMultivalueLink on: self update: #caseExpressions from: self switchLabelOwner to: anObject).
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> yieldStatementOwner [
	"Relation named: #yieldStatementOwner type: #FASTJavaYieldStatement opposite: #expression"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The yield statement that owns me'>
	<container>
	<derived>
	<FMProperty: #yieldStatementOwner type: #FASTJavaYieldStatement opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #yieldStatementOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTExpression >> yieldStatementOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #yieldStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self yieldStatementOwner.
		self attributeAt: #yieldStatementOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #yieldStatementOwner put: anObject.
		anObject expression: self ]
]
