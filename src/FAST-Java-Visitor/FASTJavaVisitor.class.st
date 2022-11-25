Class {
	#name : #FASTJavaVisitor,
	#superclass : #FASTCoreVisitor,
	#category : #'FAST-Java-Visitor'
}

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaAnnotation: aFASTJavaAnnotation [
	^ self visitFASTTExpression: aFASTJavaAnnotation
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaArrayAccess: aFASTJavaArrayAccess [
	^ self visitFASTTExpression: aFASTJavaArrayAccess
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaArrayInitializer: aFASTJavaArrayInitializer [
	^ self visitFASTTExpression: aFASTJavaArrayInitializer
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaArrayTypeExpression: aFASTJavaArrayTypeExpression [
	^ self visitFASTJavaTypeExpression: aFASTJavaArrayTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaAssertStatement: aFASTJavaAssertStatement [
	^ self visitFASTTStatement: aFASTJavaAssertStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
	^ self visitFASTTExpression: aFASTJavaAssignementExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaBodyStatement: aFASTJavaBodyStatement [
	^ self visitFASTTStatement: aFASTJavaBodyStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaBooleanTypeExpression: aFASTJavaBooleanTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaBooleanTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaBreakStatement: aFASTJavaBreakStatement [
	^ self visitFASTTStatement: aFASTJavaBreakStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaByteTypeExpression: aFASTJavaByteTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaByteTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaCaseStatement: aFASTJavaCaseStatement [
	^ self visitFASTTStatementBlock: aFASTJavaCaseStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	^ self visitFASTTExpression: aFASTJavaCastExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [
	^ self visitFASTTStatement: aFASTJavaCatchPartStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaCharTypeExpression: aFASTJavaCharTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaCharTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaCharacterLiteral: aFASTJavaCharacterLiteral [
	^ self visitFASTTCharacterLiteral: aFASTJavaCharacterLiteral
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaClassDeclaration: aFASTJavaClassDeclaration [
	^ self visitFASTTStatement: aFASTJavaClassDeclaration
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	^ self visitFASTTVariableExpression: aFASTJavaClassProperty
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaClassTypeExpression: aFASTJavaClassTypeExpression [
	^ self visitFASTJavaTypeExpression: aFASTJavaClassTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaConditionStatement: aFASTJavaConditionStatement [
	^ self visitFASTTStatement: aFASTJavaConditionStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaConditionalExpression: aFASTJavaConditionalExpression [
	^ self visitFASTTExpression: aFASTJavaConditionalExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaConditionalStatement: aFASTJavaConditionalStatement [
	^ self visitFASTTStatement: aFASTJavaConditionalStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaContinueStatement: aFASTJavaContinueStatement [
	^ self visitFASTTStatement: aFASTJavaContinueStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaDefaultCaseStatement: aFASTJavaDefaultCaseStatement [
	^ self visitFASTJavaCaseStatement: aFASTJavaDefaultCaseStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaDoWhileStatement: aFASTJavaDoWhileStatement [
	^ self visitFASTTStatement: aFASTJavaDoWhileStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaDoubleTypeExpression: aFASTJavaDoubleTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaDoubleTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaElsePartStatement: aFASTJavaElsePartStatement [
	^ self visitFASTTStatement: aFASTJavaElsePartStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaEmptyMethodDeclaration: aFASTJavaEmptyMethodDeclaration [
	^ self visitFASTJavaMethodEntity: aFASTJavaEmptyMethodDeclaration
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaEnumDeclaration: aFASTJavaEnumDeclaration [
	^ self visitFASTTStatement: aFASTJavaEnumDeclaration
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [
	^ self visitFASTTExpression: aFASTJavaFieldAccess
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaFloatLiteral: aFASTJavaFloatLiteral [
	^ self visitFASTTLiteral: aFASTJavaFloatLiteral
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaFloatTypeExpression: aFASTJavaFloatTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaFloatTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	^ self visitFASTTStatement: aFASTJavaForEachStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaForStatement: aFASTJavaForStatement [
	^ self visitFASTTStatement: aFASTJavaForStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	^ self visitFASTTVariableExpression: aFASTJavaIdentifier
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	^ self visitFASTTStatement: aFASTJavaIfStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaIncrementorsStatement: aFASTJavaIncrementorsStatement [
	^ self visitFASTTStatement: aFASTJavaIncrementorsStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	^ self visitFASTTExpression: aFASTJavaInfixOperation
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaInitializer: aFASTJavaInitializer [
	^ self visitFASTTScopableEntity: aFASTJavaInitializer
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaInitializersStatement: aFASTJavaInitializersStatement [
	^ self visitFASTTStatement: aFASTJavaInitializersStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaIntTypeExpression: aFASTJavaIntTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaIntTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaIntegerLiteral: aFASTJavaIntegerLiteral [
	^ self visitFASTTLiteral: aFASTJavaIntegerLiteral
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaInterfaceDeclaration: aFASTJavaInterfaceDeclaration [
	^ self visitFASTTStatement: aFASTJavaInterfaceDeclaration
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaLabeledCaseStatement: aFASTJavaLabeledCaseStatement [
	^ self visitFASTJavaCaseStatement: aFASTJavaLabeledCaseStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaLambdaExpression: aFASTJavaLambdaExpression [
	^ self visitFASTTExpression: aFASTJavaLambdaExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaLongTypeExpression: aFASTJavaLongTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaLongTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	^ self visitFASTTNamedBehaviouralEntity: aFASTJavaMethodEntity
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	^ self visitFASTTExpression: aFASTJavaMethodInvocation
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaMethodReference: aFASTJavaMethodReference [
	^ self visitFASTTVariableExpression: aFASTJavaMethodReference
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaModifier: aFASTJavaModifier [
	^ self visitFASTTExpression: aFASTJavaModifier
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
	^ self visitFASTTStatement: aFASTJavaNewClassMethodStatment
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	^ self visitFASTTExpression: aFASTJavaNewExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	^ self visitFASTTNullPointerLiteral: aFASTJavaNullLiteral
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaOperationLeftOperand: aFASTJavaOperationLeftOperand [
	^ self visitFASTTExpression: aFASTJavaOperationLeftOperand
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaOperationRightOperand: aFASTJavaOperationRightOperand [
	^ self visitFASTTExpression: aFASTJavaOperationRightOperand
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaOuterThis: aFASTJavaOuterThis [
	^ self visitFASTTExpression: aFASTJavaOuterThis
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaParameter: aFASTJavaParameter [
	^ self visitFASTTVariableExpression: aFASTJavaParameter
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaPrimitiveTypeExpression: aFASTJavaPrimitiveTypeExpression [
	^ self visitFASTJavaTypeExpression: aFASTJavaPrimitiveTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaQualifiedName: aFASTJavaQualifiedName [
	^ self visitFASTTEntity: aFASTJavaQualifiedName
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaQualifiedTypeName: aFASTJavaQualifiedTypeName [
	^ self visitFASTJavaTypeName: aFASTJavaQualifiedTypeName
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaSeparator: aFASTJavaSeparator [
	^ self visitFASTTVariableExpression: aFASTJavaSeparator
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaShortTypeExpression: aFASTJavaShortTypeExpression [
	^ self visitFASTJavaPrimitiveTypeExpression: aFASTJavaShortTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	^ self visitFASTTStringLiteral: aFASTJavaStringLiteral
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaSwitchStatement: aFASTJavaSwitchStatement [
	^ self visitFASTTStatement: aFASTJavaSwitchStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaSynchronizedStatement: aFASTJavaSynchronizedStatement [
	^ self visitFASTTStatement: aFASTJavaSynchronizedStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaThenPartStatement: aFASTJavaThenPartStatement [
	^ self visitFASTTStatement: aFASTJavaThenPartStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaThis: aFASTJavaThis [
	^ self visitFASTTVariableExpression: aFASTJavaThis
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaThrowStatement: aFASTJavaThrowStatement [
	^ self visitFASTTStatement: aFASTJavaThrowStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	^ self visitFASTTStatement: aFASTJavaTryCatchStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaTryPartStatement: aFASTJavaTryPartStatement [
	^ self visitFASTTStatement: aFASTJavaTryPartStatement
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaTypeExpression: aFASTJavaTypeExpression [
	^ self visitFASTTVariableExpression: aFASTJavaTypeExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaTypeName: aFASTJavaTypeName [
	^ self visitFASTTExpression: aFASTJavaTypeName
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaUnaryExpression: aFASTJavaUnaryExpression [
	^ self visitFASTTExpression: aFASTJavaUnaryExpression
]

{ #category : #generated }
FASTJavaVisitor >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	^ self visitFASTTStatement: aFASTJavaVarDeclStatement
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
	^ self visitFASTTStatement: aFASTJavaWhileStatement
]
