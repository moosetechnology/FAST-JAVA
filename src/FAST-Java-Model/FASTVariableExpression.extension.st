Extension { #name : #FASTVariableExpression }

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaAssignementExpressioOwner [
	"Relation named: #javaAssignementExpressioOwner type: #FASTAssignementExpression opposite: #variable"

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
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaAssignementExpressioOwner.
		self privateState attributeAt: #javaAssignementExpressioOwner put: anObject.
		otherSide variable: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaAssignementExpressioOwner put: anObject.
		anObject variable: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaAssignementVariableOwner [
	"Relation named: #javaAssignementVariableOwner type: #FASTAssignementExpression opposite: #variable"

	<generated>
	<MSEComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>
	<MSEProperty: #javaAssignementVariableOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaAssignementVariableOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaAssignementVariableOwner: anObject [
	
	<generated>
	(self privateState attributeAt: #javaAssignementVariableOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaAssignementVariableOwner.
		self privateState attributeAt: #javaAssignementVariableOwner put: anObject.
		otherSide variable: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaAssignementVariableOwner put: anObject.
		anObject variable: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaCastExpressionTypeOwner [
	"Relation named: #javaCastExpressionTypeOwner type: #FASTCastExpression opposite: #type"

	<generated>
	<MSEComment: 'The javaCastExpression owner (if possible)'>
	<container>
	<MSEProperty: #javaCastExpressionTypeOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaCastExpressionTypeOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaCastExpressionTypeOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaCastExpressionTypeOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaCastExpressionTypeOwner.
		self privateState attributeAt: #javaCastExpressionTypeOwner put: anObject.
		otherSide type: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaCastExpressionTypeOwner put: anObject.
		anObject type: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaCatchParameterOwnler [
	"Relation named: #javaCatchParameterOwnler type: #FASTCatchPartStatement opposite: #parameter"

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
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaCatchParameterOwnler.
		self privateState attributeAt: #javaCatchParameterOwnler put: anObject.
		otherSide parameter: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaCatchParameterOwnler put: anObject.
		anObject parameter: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaClassPropertyOwner [
	"Relation named: #javaClassPropertyOwner type: #FASTClassProperty opposite: #type"

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
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaClassPropertyOwner.
		self privateState attributeAt: #javaClassPropertyOwner put: anObject.
		otherSide type: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaClassPropertyOwner put: anObject.
		anObject type: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaForEachStatementFieldNameOwner [
	"Relation named: #javaForEachStatementFieldNameOwner type: #FASTForEachStatement opposite: #fieldname"

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
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaForEachStatementFieldNameOwner.
		self privateState attributeAt: #javaForEachStatementFieldNameOwner put: anObject.
		otherSide fieldname: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaForEachStatementFieldNameOwner put: anObject.
		anObject fieldname: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaForEachStatementTypeOwner [
	"Relation named: #javaForEachStatementTypeOwner type: #FASTForEachStatement opposite: #type"

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
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaForEachStatementTypeOwner.
		self privateState attributeAt: #javaForEachStatementTypeOwner put: anObject.
		otherSide type: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaForEachStatementTypeOwner put: anObject.
		anObject type: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaLambdaParameterOwner [
	"Relation named: #javaLambdaParameterOwner type: #FASTLambdaExpression opposite: #parameters"

	<generated>
	<MSEComment: 'The lambda parameters owner (if possible)'>
	<container>
	<MSEProperty: #javaLambdaParameterOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaLambdaParameterOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaLambdaParameterOwner: anObject [

	<generated>
	self privateState attributeAt: #javaLambdaParameterOwner put: (FMMultivalueLink on: self update: #parameters from: self javaLambdaParameterOwner to: anObject).
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaMethodReferenceOwner [
	"Relation named: #javaMethodReferenceOwner type: #FASTMethodReference opposite: #receiver"

	<generated>
	<MSEComment: 'The owner of the method reference (if possible)'>
	<container>
	<MSEProperty: #javaMethodReferenceOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaMethodReferenceOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaMethodReferenceOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaMethodReferenceOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaMethodReferenceOwner.
		self privateState attributeAt: #javaMethodReferenceOwner put: anObject.
		otherSide receiver: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaMethodReferenceOwner put: anObject.
		anObject receiver: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaMethodTypeOwner [
	"Relation named: #javaMethodTypeOwner type: #FASTMethodEntity opposite: #type"

	<generated>
	<MSEComment: 'The variable expression owner (if possible)'>
	<container>
	<MSEProperty: #javaMethodTypeOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaMethodTypeOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaMethodTypeOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaMethodTypeOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaMethodTypeOwner.
		self privateState attributeAt: #javaMethodTypeOwner put: anObject.
		otherSide type: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaMethodTypeOwner put: anObject.
		anObject type: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaNewExpressionOwner [
	"Relation named: #javaNewExpressionOwner type: #FASTNewExpression opposite: #type"

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
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaNewExpressionOwner.
		self privateState attributeAt: #javaNewExpressionOwner put: anObject.
		otherSide type: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaNewExpressionOwner put: anObject.
		anObject type: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaOuterThisOwner [
	"Relation named: #javaOuterThisOwner type: #FASTOuterThis opposite: #type"

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
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaOuterThisOwner.
		self privateState attributeAt: #javaOuterThisOwner put: anObject.
		otherSide type: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaOuterThisOwner put: anObject.
		anObject type: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaParameterTypeOwner [
	"Relation named: #javaParameterTypeOwner type: #FASTParameter opposite: #type"

	<generated>
	<MSEComment: 'The variable expression owner (if possible)'>
	<container>
	<MSEProperty: #javaParameterTypeOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaParameterTypeOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaParameterTypeOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaParameterTypeOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaParameterTypeOwner.
		self privateState attributeAt: #javaParameterTypeOwner put: anObject.
		otherSide type: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaParameterTypeOwner put: anObject.
		anObject type: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaParameterVariableOwner [
	"Relation named: #javaParameterVariableOwner type: #FASTParameter opposite: #variable"

	<generated>
	<MSEComment: 'The variable expression owner (if possible)'>
	<container>
	<MSEProperty: #javaParameterVariableOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaParameterVariableOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaParameterVariableOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaParameterVariableOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaParameterVariableOwner.
		self privateState attributeAt: #javaParameterVariableOwner put: anObject.
		otherSide variable: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaParameterVariableOwner put: anObject.
		anObject variable: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaVarDeclTypeOwner [
	"Relation named: #javaVarDeclTypeOwner type: #FASTVarDeclStatement opposite: #type"

	<generated>
	<MSEComment: 'The variable expression owner (if possible)'>
	<container>
	<MSEProperty: #javaVarDeclTypeOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaVarDeclTypeOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaVarDeclTypeOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaVarDeclTypeOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaVarDeclTypeOwner.
		self privateState attributeAt: #javaVarDeclTypeOwner put: anObject.
		otherSide type: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaVarDeclTypeOwner put: anObject.
		anObject type: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> javaVariableDeclaratorOwner [
	"Relation named: #javaVariableDeclaratorOwner type: #FASTVariableDeclarator opposite: #variable"

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
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaVariableDeclaratorOwner.
		self privateState attributeAt: #javaVariableDeclaratorOwner put: anObject.
		otherSide variable: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaVariableDeclaratorOwner put: anObject.
		anObject variable: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> variableExpressionOwnerIsAnnotation [
	"Relation named: #variableExpressionOwnerIsAnnotation type: #FASTAnnotation opposite: #expression"

	<generated>
	<MSEComment: 'The annotation that own me'>
	<container>
	<MSEProperty: #variableExpressionOwnerIsAnnotation type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #variableExpressionOwnerIsAnnotation ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTVariableExpression >> variableExpressionOwnerIsAnnotation: anObject [

	<generated>
	(self privateState attributeAt: #variableExpressionOwnerIsAnnotation ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self variableExpressionOwnerIsAnnotation.
		self privateState attributeAt: #variableExpressionOwnerIsAnnotation put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #variableExpressionOwnerIsAnnotation put: anObject.
		anObject expression: self ]
]
