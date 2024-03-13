Extension { #name : #FASTTExpression }

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> assertConditionOwner [
	"Relation named: #assertConditionOwner type: #FASTJavaAssertStatement opposite: #condition"

	<generated>
	<FMComment: 'I represent a condition for my owner'>
	<container>
	<derived>
	<FMProperty: #assertConditionOwner type: #FASTJavaAssertStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #assertConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> assertConditionOwner: anObject [

	<generated>
	(self attributeAt: #assertConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self assertConditionOwner.
		self attributeAt: #assertConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #assertConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> conditionalConditionOwner [
	"Relation named: #conditionalConditionOwner type: #FASTJavaConditionalExpression opposite: #condition"

	<generated>
	<FMComment: 'I represent a condition for my owner'>
	<container>
	<derived>
	<FMProperty: #conditionalConditionOwner type: #FASTJavaConditionalExpression opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #conditionalConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> conditionalConditionOwner: anObject [

	<generated>
	(self attributeAt: #conditionalConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self conditionalConditionOwner.
		self attributeAt: #conditionalConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #conditionalConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> conditionalElsePartOwner [
	"Relation named: #conditionalElsePartOwner type: #FASTJavaConditionalExpression opposite: #elsePart"

	<generated>
	<FMComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #conditionalElsePartOwner type: #FASTJavaConditionalExpression opposite: #elsePart>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #conditionalElsePartOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> conditionalElsePartOwner: anObject [

	<generated>
	(self attributeAt: #conditionalElsePartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self conditionalElsePartOwner.
		self attributeAt: #conditionalElsePartOwner put: anObject.
		otherSide elsePart: nil ]
	ifNotNil: [ 
		self attributeAt: #conditionalElsePartOwner put: anObject.
		anObject elsePart: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> conditionalThenPartOwner [
	"Relation named: #conditionalThenPartOwner type: #FASTJavaConditionalExpression opposite: #thenPart"

	<generated>
	<FMComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #conditionalThenPartOwner type: #FASTJavaConditionalExpression opposite: #thenPart>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #conditionalThenPartOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> conditionalThenPartOwner: anObject [

	<generated>
	(self attributeAt: #conditionalThenPartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self conditionalThenPartOwner.
		self attributeAt: #conditionalThenPartOwner put: anObject.
		otherSide thenPart: nil ]
	ifNotNil: [ 
		self attributeAt: #conditionalThenPartOwner put: anObject.
		anObject thenPart: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> doConditionOwner [
	"Relation named: #doConditionOwner type: #FASTJavaDoWhileStatement opposite: #condition"

	<generated>
	<FMComment: 'I represent a condition for my owner'>
	<container>
	<derived>
	<FMProperty: #doConditionOwner type: #FASTJavaDoWhileStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #doConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> doConditionOwner: anObject [

	<generated>
	(self attributeAt: #doConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self doConditionOwner.
		self attributeAt: #doConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #doConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> forConditionOwner [
	"Relation named: #forConditionOwner type: #FASTJavaForStatement opposite: #condition"

	<generated>
	<FMComment: 'I represent a condition for my owner'>
	<container>
	<derived>
	<FMProperty: #forConditionOwner type: #FASTJavaForStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #forConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> forConditionOwner: anObject [

	<generated>
	(self attributeAt: #forConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self forConditionOwner.
		self attributeAt: #forConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #forConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> ifConditionOwner [
	"Relation named: #ifConditionOwner type: #FASTJavaIfStatement opposite: #condition"

	<generated>
	<FMComment: 'I represent a condition for my owner'>
	<container>
	<derived>
	<FMProperty: #ifConditionOwner type: #FASTJavaIfStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #ifConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> ifConditionOwner: anObject [

	<generated>
	(self attributeAt: #ifConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ifConditionOwner.
		self attributeAt: #ifConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #ifConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaArrayAccessOwner [
	"Relation named: #javaArrayAccessOwner type: #FASTJavaArrayAccess opposite: #expression"

	<generated>
	<FMComment: 'The javaArrayAccess owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaArrayAccessOwner type: #FASTJavaArrayAccess opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaArrayAccessOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaArrayAccessOwner: anObject [

	<generated>
	(self attributeAt: #javaArrayAccessOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaArrayAccessOwner.
		self attributeAt: #javaArrayAccessOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaArrayAccessOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaArrayArrayAccessOwner [
	"Relation named: #javaArrayArrayAccessOwner type: #FASTJavaArrayAccess opposite: #array"

	<generated>
	<FMComment: 'The javaArrayArrayAccess owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaArrayArrayAccessOwner type: #FASTJavaArrayAccess opposite: #array>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaArrayArrayAccessOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaArrayArrayAccessOwner: anObject [

	<generated>
	(self attributeAt: #javaArrayArrayAccessOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaArrayArrayAccessOwner.
		self attributeAt: #javaArrayArrayAccessOwner put: anObject.
		otherSide array: nil ]
	ifNotNil: [ 
		self attributeAt: #javaArrayArrayAccessOwner put: anObject.
		anObject array: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaArrayInitializers [
	"Relation named: #javaArrayInitializers type: #FASTJavaArrayInitializer opposite: #initializers"

	<generated>
	<FMComment: 'The owner of the expression'>
	<container>
	<FMProperty: #javaArrayInitializers type: #FASTJavaArrayInitializer opposite: #initializers>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaArrayInitializers ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaArrayInitializers: anObject [

	<generated>
	self attributeAt: #javaArrayInitializers put: (FMMultivalueLink on: self update: #initializers from: self javaArrayInitializers to: anObject).
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaArrayTypeNameOwner [
	"Relation named: #javaArrayTypeNameOwner type: #FASTJavaArrayTypeExpression opposite: #baseType"

	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaArrayTypeNameOwner type: #FASTJavaArrayTypeExpression opposite: #baseType>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaArrayTypeNameOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaArrayTypeNameOwner: anObject [

	<generated>
	(self attributeAt: #javaArrayTypeNameOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaArrayTypeNameOwner.
		self attributeAt: #javaArrayTypeNameOwner put: anObject.
		otherSide baseType: nil ]
	ifNotNil: [ 
		self attributeAt: #javaArrayTypeNameOwner put: anObject.
		anObject baseType: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaAssignmentExpressionOwner [
	"Relation named: #javaAssignmentExpressionOwner type: #FASTJavaAssignmentExpression opposite: #expression"

	<generated>
	<FMComment: 'The javaAssignmentExpression owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaAssignmentExpressionOwner type: #FASTJavaAssignmentExpression opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaAssignmentExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaAssignmentExpressionOwner: anObject [

	<generated>
	(self attributeAt: #javaAssignmentExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaAssignmentExpressionOwner.
		self attributeAt: #javaAssignmentExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaAssignmentExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaCastExpressionOwner [
	"Relation named: #javaCastExpressionOwner type: #FASTJavaCastExpression opposite: #expression"

	<generated>
	<FMComment: 'The javaCastExpression owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaCastExpressionOwner type: #FASTJavaCastExpression opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaCastExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaCastExpressionOwner: anObject [

	<generated>
	(self attributeAt: #javaCastExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaCastExpressionOwner.
		self attributeAt: #javaCastExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaCastExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaForEachStatementOwner [
	"Relation named: #javaForEachStatementOwner type: #FASTJavaForEachStatement opposite: #list"

	<generated>
	<FMComment: 'The javaForEachStatement owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaForEachStatementOwner type: #FASTJavaForEachStatement opposite: #list>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaForEachStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaForEachStatementOwner: anObject [

	<generated>
	(self attributeAt: #javaForEachStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaForEachStatementOwner.
		self attributeAt: #javaForEachStatementOwner put: anObject.
		otherSide list: nil ]
	ifNotNil: [ 
		self attributeAt: #javaForEachStatementOwner put: anObject.
		anObject list: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaLabeledCaseStatementOwner [
	"Relation named: #javaLabeledCaseStatementOwner type: #FASTJavaLabeledCaseStatement opposite: #label"

	<generated>
	<FMComment: 'The javaLabeledCaseStatement owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaLabeledCaseStatementOwner type: #FASTJavaLabeledCaseStatement opposite: #label>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaLabeledCaseStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaLabeledCaseStatementOwner: anObject [

	<generated>
	(self attributeAt: #javaLabeledCaseStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaLabeledCaseStatementOwner.
		self attributeAt: #javaLabeledCaseStatementOwner put: anObject.
		otherSide label: nil ]
	ifNotNil: [ 
		self attributeAt: #javaLabeledCaseStatementOwner put: anObject.
		anObject label: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaNewArrayInitialOwner [
	"Relation named: #javaNewArrayInitialOwner type: #FASTJavaNewArray opposite: #initializer"

	<generated>
	<FMComment: 'I belong to a new array initialization'>
	<container>
	<derived>
	<FMProperty: #javaNewArrayInitialOwner type: #FASTJavaNewArray opposite: #initializer>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaNewArrayInitialOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaNewArrayInitialOwner: anObject [

	<generated>
	(self attributeAt: #javaNewArrayInitialOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaNewArrayInitialOwner.
		self attributeAt: #javaNewArrayInitialOwner put: anObject.
		otherSide initializer: nil ]
	ifNotNil: [ 
		self attributeAt: #javaNewArrayInitialOwner put: anObject.
		anObject initializer: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaStringAssertStatementOwner [
	"Relation named: #javaStringAssertStatementOwner type: #FASTJavaAssertStatement opposite: #message"

	<generated>
	<FMComment: 'The assertion which I describe'>
	<container>
	<derived>
	<FMProperty: #javaStringAssertStatementOwner type: #FASTJavaAssertStatement opposite: #message>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaStringAssertStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaStringAssertStatementOwner: anObject [

	<generated>
	(self attributeAt: #javaStringAssertStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaStringAssertStatementOwner.
		self attributeAt: #javaStringAssertStatementOwner put: anObject.
		otherSide message: nil ]
	ifNotNil: [ 
		self attributeAt: #javaStringAssertStatementOwner put: anObject.
		anObject message: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaSynchronizedStatementOwner [
	"Relation named: #javaSynchronizedStatementOwner type: #FASTJavaSynchronizedStatement opposite: #expression"

	<generated>
	<FMComment: 'The owner of the synchronized block (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaSynchronizedStatementOwner type: #FASTJavaSynchronizedStatement opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaSynchronizedStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaSynchronizedStatementOwner: anObject [

	<generated>
	(self attributeAt: #javaSynchronizedStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaSynchronizedStatementOwner.
		self attributeAt: #javaSynchronizedStatementOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaSynchronizedStatementOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaThrowStatementOwner [
	"Relation named: #javaThrowStatementOwner type: #FASTJavaThrowStatement opposite: #expression"

	<generated>
	<FMComment: 'The javaThrowStatement owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaThrowStatementOwner type: #FASTJavaThrowStatement opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaThrowStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaThrowStatementOwner: anObject [

	<generated>
	(self attributeAt: #javaThrowStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaThrowStatementOwner.
		self attributeAt: #javaThrowStatementOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaThrowStatementOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaVariableDeclaratorExpressionOwner [
	"Relation named: #javaVariableDeclaratorExpressionOwner type: #FASTJavaVariableDeclarator opposite: #expression"

	<generated>
	<FMComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaVariableDeclaratorExpressionOwner type: #FASTJavaVariableDeclarator opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaVariableDeclaratorExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> javaVariableDeclaratorExpressionOwner: anObject [

	<generated>
	(self attributeAt: #javaVariableDeclaratorExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaVariableDeclaratorExpressionOwner.
		self attributeAt: #javaVariableDeclaratorExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaVariableDeclaratorExpressionOwner put: anObject.
		anObject expression: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> switchConditionOwner [
	"Relation named: #switchConditionOwner type: #FASTJavaSwitchStatement opposite: #condition"

	<generated>
	<FMComment: 'I represent a condition for my owner'>
	<container>
	<derived>
	<FMProperty: #switchConditionOwner type: #FASTJavaSwitchStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #switchConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> switchConditionOwner: anObject [

	<generated>
	(self attributeAt: #switchConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self switchConditionOwner.
		self attributeAt: #switchConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #switchConditionOwner put: anObject.
		anObject condition: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> whileConditionOwner [
	"Relation named: #whileConditionOwner type: #FASTJavaWhileStatement opposite: #condition"

	<generated>
	<FMComment: 'I represent a condition for my owner'>
	<container>
	<derived>
	<FMProperty: #whileConditionOwner type: #FASTJavaWhileStatement opposite: #condition>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #whileConditionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTTExpression >> whileConditionOwner: anObject [

	<generated>
	(self attributeAt: #whileConditionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self whileConditionOwner.
		self attributeAt: #whileConditionOwner put: anObject.
		otherSide condition: nil ]
	ifNotNil: [ 
		self attributeAt: #whileConditionOwner put: anObject.
		anObject condition: self ]
]
