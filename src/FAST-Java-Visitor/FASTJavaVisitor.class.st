Class {
	#name : #FASTJavaVisitor,
	#superclass : #FASTCoreVisitor,
	#category : #'FAST-Java-Visitor'
}

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaAnnotation: aFASTJavaAnnotation [
	^ self visitFASTExpression: aFASTJavaAnnotation
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaArrayAccess: aFASTJavaArrayAccess [
	^ self visitFASTExpression: aFASTJavaArrayAccess
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaArrayInitializer: aFASTJavaArrayInitializer [
	^ self visitFASTExpression: aFASTJavaArrayInitializer
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaArrayTypeExpression: aFASTJavaArrayTypeExpression [
	^ self visitFASTJavaTypeExpression: aFASTJavaArrayTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaAssertStatement: aFASTJavaAssertStatement [
	^ self visitFASTStatement: aFASTJavaAssertStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
	^ self visitFASTExpression: aFASTJavaAssignementExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaBodyStatement: aFASTJavaBodyStatement [
	^ self visitFASTStatement: aFASTJavaBodyStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaBooleanTypeExpression: aFASTJavaBooleanTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaBooleanTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaBreakStatement: aFASTJavaBreakStatement [
	^ self visitFASTStatement: aFASTJavaBreakStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaByteTypeExpression: aFASTJavaByteTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaByteTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaCaseStatement: aFASTJavaCaseStatement [
	^ self visitFASTStatementBlock: aFASTJavaCaseStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	^ self visitFASTExpression: aFASTJavaCastExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [
	^ self visitFASTStatement: aFASTJavaCatchPartStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaCharTypeExpression: aFASTJavaCharTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaCharTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaCharacterLiteral: aFASTJavaCharacterLiteral [
	^ self visitFASTCharacterLiteral: aFASTJavaCharacterLiteral
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaClassDeclaration: aFASTJavaClassDeclaration [
	^ self visitFASTStatement: aFASTJavaClassDeclaration
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	^ self visitFASTVariableExpression: aFASTJavaClassProperty
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaClassTypeExpression: aFASTJavaClassTypeExpression [
	^ self visitFASTJavaTypeExpression: aFASTJavaClassTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaConditionStatement: aFASTJavaConditionStatement [
	^ self visitFASTStatement: aFASTJavaConditionStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaConditionalExpression: aFASTJavaConditionalExpression [
	^ self visitFASTExpression: aFASTJavaConditionalExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaConditionalStatement: aFASTJavaConditionalStatement [
	^ self visitFASTStatement: aFASTJavaConditionalStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaContinueStatement: aFASTJavaContinueStatement [
	^ self visitFASTStatement: aFASTJavaContinueStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaDefaultCaseStatement: aFASTJavaDefaultCaseStatement [
	^ self visitFASTJavaCaseStatement: aFASTJavaDefaultCaseStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaDoWhileStatement: aFASTJavaDoWhileStatement [
	^ self visitFASTStatement: aFASTJavaDoWhileStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaDoubleTypeExpression: aFASTJavaDoubleTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaDoubleTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaElsePartStatement: aFASTJavaElsePartStatement [
	^ self visitFASTStatement: aFASTJavaElsePartStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaEmptyMethodDeclaration: aFASTJavaEmptyMethodDeclaration [
	^ self visitFASTJavaMethodEntity: aFASTJavaEmptyMethodDeclaration
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [
	^ self visitFASTExpression: aFASTJavaFieldAccess
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaFloatLiteral: aFASTJavaFloatLiteral [
	^ self visitFASTLiteral: aFASTJavaFloatLiteral
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaFloatTypeExpression: aFASTJavaFloatTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaFloatTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	^ self visitFASTStatement: aFASTJavaForEachStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaForStatement: aFASTJavaForStatement [
	^ self visitFASTStatement: aFASTJavaForStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	^ self visitFASTVariableExpression: aFASTJavaIdentifier
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	^ self visitFASTStatement: aFASTJavaIfStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaIncrementorsStatement: aFASTJavaIncrementorsStatement [
	^ self visitFASTStatement: aFASTJavaIncrementorsStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	^ self visitFASTExpression: aFASTJavaInfixOperation
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaInitializer: aFASTJavaInitializer [
	^ self visitFASTScopableEntity: aFASTJavaInitializer
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaInitializersStatement: aFASTJavaInitializersStatement [
	^ self visitFASTStatement: aFASTJavaInitializersStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaIntTypeExpression: aFASTJavaIntTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaIntTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaIntegerLiteral: aFASTJavaIntegerLiteral [
	^ self visitFASTLiteral: aFASTJavaIntegerLiteral
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaLabeledCaseStatement: aFASTJavaLabeledCaseStatement [
	^ self visitFASTJavaCaseStatement: aFASTJavaLabeledCaseStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaLambdaExpression: aFASTJavaLambdaExpression [
	^ self visitFASTExpression: aFASTJavaLambdaExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaLongTypeExpression: aFASTJavaLongTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaLongTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	^ self visitFASTNamedBehaviouralEntity: aFASTJavaMethodEntity
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	^ self visitFASTExpression: aFASTJavaMethodInvocation
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaMethodReference: aFASTJavaMethodReference [
	^ self visitFASTVariableExpression: aFASTJavaMethodReference
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaModifier: aFASTJavaModifier [
	^ self visitFASTExpression: aFASTJavaModifier
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaNewArray: aFASTJavaNewArray [
	^ self visitFASTJavaNewExpression: aFASTJavaNewArray
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression [
	^ self visitFASTJavaNewExpression: aFASTJavaNewClassExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaNewClassMethodStatment: aFASTJavaNewClassMethodStatment [
	^ self visitFASTStatement: aFASTJavaNewClassMethodStatment
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	^ self visitFASTExpression: aFASTJavaNewExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	^ self visitFASTNullPointerLiteral: aFASTJavaNullLiteral
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaOperationLeftOperand: aFASTJavaOperationLeftOperand [
	^ self visitFASTExpression: aFASTJavaOperationLeftOperand
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaOperationRightOperand: aFASTJavaOperationRightOperand [
	^ self visitFASTExpression: aFASTJavaOperationRightOperand
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaOuterThis: aFASTJavaOuterThis [
	^ self visitFASTExpression: aFASTJavaOuterThis
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	^ self visitFASTVariableExpression: aFASTJavaParameter
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaPrimitiveTypeExpression: aFASTJavaPrimitiveTypeExpression [
	^ self visitFASTJavaTypeExpression: aFASTJavaPrimitiveTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaQualifiedTypeName: aFASTJavaQualifiedTypeName [
	^ self visitFASTJavaTypeName: aFASTJavaQualifiedTypeName
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaSeparator: aFASTJavaSeparator [
	^ self visitFASTVariableExpression: aFASTJavaSeparator
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaShortTypeExpression: aFASTJavaShortTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaShortTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	^ self visitFASTStringLiteral: aFASTJavaStringLiteral
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaSwitchStatement: aFASTJavaSwitchStatement [
	^ self visitFASTStatement: aFASTJavaSwitchStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaSynchronizedStatement: aFASTJavaSynchronizedStatement [
	^ self visitFASTStatement: aFASTJavaSynchronizedStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaThenPartStatement: aFASTJavaThenPartStatement [
	^ self visitFASTStatement: aFASTJavaThenPartStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaThis: aFASTJavaThis [
	^ self visitFASTVariableExpression: aFASTJavaThis
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaThrowStatement: aFASTJavaThrowStatement [
	^ self visitFASTStatement: aFASTJavaThrowStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	^ self visitFASTStatement: aFASTJavaTryCatchStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaTryPartStatement: aFASTJavaTryPartStatement [
	^ self visitFASTStatement: aFASTJavaTryPartStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaTypeExpression: aFASTJavaTypeExpression [
	^ self visitFASTVariableExpression: aFASTJavaTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaTypeName: aFASTJavaTypeName [
	^ self visitFASTExpression: aFASTJavaTypeName
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaUnaryExpression: aFASTJavaUnaryExpression [
	^ self visitFASTExpression: aFASTJavaUnaryExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	^ self visitFASTStatement: aFASTJavaVarDeclStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	^ self visitFASTEntity: aFASTJavaVariableDeclarator
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaVoidTypeExpression: aFASTJavaVoidTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaVoidTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [
	^ self visitFASTStatement: aFASTJavaWhileStatement
]
