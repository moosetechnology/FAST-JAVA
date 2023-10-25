"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FASTJavaTEntityCreator,
	#category : #'FAST-Java-Model-Model'
}

{ #category : #meta }
FASTJavaTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newAnnotation [

	<generated>
	^ self add: FASTJavaAnnotation new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newArrayAccess [

	<generated>
	^ self add: FASTJavaArrayAccess new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newArrayInitializer [

	<generated>
	^ self add: FASTJavaArrayInitializer new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newArrayTypeExpression [

	<generated>
	^ self add: FASTJavaArrayTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newAssertStatement [

	<generated>
	^ self add: FASTJavaAssertStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newAssignmentExpression [

	<generated>
	^ self add: FASTJavaAssignmentExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newBooleanLiteral [

	<generated>
	^ self add: FASTJavaBooleanLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newBooleanTypeExpression [

	<generated>
	^ self add: FASTJavaBooleanTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newBreakStatement [

	<generated>
	^ self add: FASTJavaBreakStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newByteTypeExpression [

	<generated>
	^ self add: FASTJavaByteTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newCaseStatement [

	<generated>
	^ self add: FASTJavaCaseStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newCastExpression [

	<generated>
	^ self add: FASTJavaCastExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newCatchPartStatement [

	<generated>
	^ self add: FASTJavaCatchPartStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newCharTypeExpression [

	<generated>
	^ self add: FASTJavaCharTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newCharacterLiteral [

	<generated>
	^ self add: FASTJavaCharacterLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newClassDeclaration [

	<generated>
	^ self add: FASTJavaClassDeclaration new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newClassProperty [

	<generated>
	^ self add: FASTJavaClassProperty new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newClassTypeExpression [

	<generated>
	^ self add: FASTJavaClassTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newComment [

	<generated>
	^ self add: FASTJavaComment new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newCompilationUnit [

	<generated>
	^ self add: FASTJavaCompilationUnit new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newConditionalExpression [

	<generated>
	^ self add: FASTJavaConditionalExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newContinueStatement [

	<generated>
	^ self add: FASTJavaContinueStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newDefaultCaseStatement [

	<generated>
	^ self add: FASTJavaDefaultCaseStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newDoWhileStatement [

	<generated>
	^ self add: FASTJavaDoWhileStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newDoubleLiteral [

	<generated>
	^ self add: FASTJavaDoubleLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newDoubleTypeExpression [

	<generated>
	^ self add: FASTJavaDoubleTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newEmptyDimExpression [

	<generated>
	^ self add: FASTJavaEmptyDimExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newEmptyMethodDeclaration [

	<generated>
	^ self add: FASTJavaEmptyMethodDeclaration new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newEnumConstant [

	<generated>
	^ self add: FASTJavaEnumConstant new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newEnumDeclaration [

	<generated>
	^ self add: FASTJavaEnumDeclaration new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newExpressionStatement [

	<generated>
	^ self add: FASTJavaExpressionStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newFieldAccess [

	<generated>
	^ self add: FASTJavaFieldAccess new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newFloatLiteral [

	<generated>
	^ self add: FASTJavaFloatLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newFloatTypeExpression [

	<generated>
	^ self add: FASTJavaFloatTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newForEachStatement [

	<generated>
	^ self add: FASTJavaForEachStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newForStatement [

	<generated>
	^ self add: FASTJavaForStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newIdentifier [

	<generated>
	^ self add: FASTJavaIdentifier new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newIfStatement [

	<generated>
	^ self add: FASTJavaIfStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newImportDeclaration [

	<generated>
	^ self add: FASTJavaImportDeclaration new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newInfixOperation [

	<generated>
	^ self add: FASTJavaInfixOperation new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newInitializer [

	<generated>
	^ self add: FASTJavaInitializer new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newIntTypeExpression [

	<generated>
	^ self add: FASTJavaIntTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newIntegerLiteral [

	<generated>
	^ self add: FASTJavaIntegerLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newInterfaceDeclaration [

	<generated>
	^ self add: FASTJavaInterfaceDeclaration new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newLabeledCaseStatement [

	<generated>
	^ self add: FASTJavaLabeledCaseStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newLabeledStatement [

	<generated>
	^ self add: FASTJavaLabeledStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newLambdaExpression [

	<generated>
	^ self add: FASTJavaLambdaExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newLongLiteral [

	<generated>
	^ self add: FASTJavaLongLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newLongTypeExpression [

	<generated>
	^ self add: FASTJavaLongTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newMethodEntity [

	<generated>
	^ self add: FASTJavaMethodEntity new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newMethodInvocation [

	<generated>
	^ self add: FASTJavaMethodInvocation new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newMethodReference [

	<generated>
	^ self add: FASTJavaMethodReference new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newModifier [

	<generated>
	^ self add: FASTJavaModifier new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newNewArray [

	<generated>
	^ self add: FASTJavaNewArray new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newNewClassExpression [

	<generated>
	^ self add: FASTJavaNewClassExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newNewExpression [

	<generated>
	^ self add: FASTJavaNewExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newNullLiteral [

	<generated>
	^ self add: FASTJavaNullLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newOuterThis [

	<generated>
	^ self add: FASTJavaOuterThis new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newPackageDeclaration [

	<generated>
	^ self add: FASTJavaPackageDeclaration new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newParameter [

	<generated>
	^ self add: FASTJavaParameter new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newPrimitiveTypeExpression [

	<generated>
	^ self add: FASTJavaPrimitiveTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newQualifiedName [

	<generated>
	^ self add: FASTJavaQualifiedName new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newQualifiedTypeName [

	<generated>
	^ self add: FASTJavaQualifiedTypeName new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newReturnStatement [

	<generated>
	^ self add: FASTJavaReturnStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newShortTypeExpression [

	<generated>
	^ self add: FASTJavaShortTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newStatement [

	<generated>
	^ self add: FASTJavaStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newStatementBlock [

	<generated>
	^ self add: FASTJavaStatementBlock new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newStringLiteral [

	<generated>
	^ self add: FASTJavaStringLiteral new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newSwitchStatement [

	<generated>
	^ self add: FASTJavaSwitchStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newSynchronizedStatement [

	<generated>
	^ self add: FASTJavaSynchronizedStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newThis [

	<generated>
	^ self add: FASTJavaThis new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newThrowStatement [

	<generated>
	^ self add: FASTJavaThrowStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newTryCatchStatement [

	<generated>
	^ self add: FASTJavaTryCatchStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newTypeExpression [

	<generated>
	^ self add: FASTJavaTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newTypeName [

	<generated>
	^ self add: FASTJavaTypeName new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newTypeParameterExpression [

	<generated>
	^ self add: FASTJavaTypeParameterExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newUnaryExpression [

	<generated>
	^ self add: FASTJavaUnaryExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newVarDeclStatement [

	<generated>
	^ self add: FASTJavaVarDeclStatement new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newVariableDeclarator [

	<generated>
	^ self add: FASTJavaVariableDeclarator new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newVariableExpression [

	<generated>
	^ self add: FASTJavaVariableExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newVoidTypeExpression [

	<generated>
	^ self add: FASTJavaVoidTypeExpression new
]

{ #category : #'entity creation' }
FASTJavaTEntityCreator >> newWhileStatement [

	<generated>
	^ self add: FASTJavaWhileStatement new
]
