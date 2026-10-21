"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FASTJavaTEntityCreator',
	#category : 'FAST-Java-Model-Model',
	#package : 'FAST-Java-Model',
	#tag : 'Model'
}

{ #category : 'meta' }
FASTJavaTEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newAnnotation [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaAnnotation new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newAnnotationElementDeclaration [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaAnnotationElementDeclaration new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newAnnotationInterfaceDeclaration [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaAnnotationInterfaceDeclaration new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newArrayAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaArrayAccess new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newArrayAnnotationElement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaArrayAnnotationElement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newArrayInitializer [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaArrayInitializer new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newArrayTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaArrayTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newAssertStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaAssertStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newAssignmentExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaAssignmentExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newBooleanLiteral [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaBooleanLiteral new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newBooleanTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaBooleanTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newBreakStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaBreakStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newByteTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaByteTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newCaseStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaCaseStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newCastExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaCastExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newCatchPartStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaCatchPartStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newCharTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaCharTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newCharacterLiteral [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaCharacterLiteral new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newClassDeclaration [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaClassDeclaration new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newClassProperty [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaClassProperty new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newClassTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaClassTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaComment new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newCompilationUnit [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaCompilationUnit new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newConditionalExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaConditionalExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newContinueStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaContinueStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newDefaultCaseStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaDefaultCaseStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newDoWhileStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaDoWhileStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newDoubleLiteral [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaDoubleLiteral new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newDoubleTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaDoubleTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newEmptyDimExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaEmptyDimExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newEmptyMethodDeclaration [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaEmptyMethodDeclaration new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newEnumConstant [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaEnumConstant new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newEnumDeclaration [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaEnumDeclaration new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newExpressionStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaExpressionStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newFieldAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaFieldAccess new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newFloatLiteral [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaFloatLiteral new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newFloatTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaFloatTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newForEachStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaForEachStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newForStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaForStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newIdentifier [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaIdentifier new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newIfStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaIfStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newImportDeclaration [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaImportDeclaration new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newInfixOperation [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaInfixOperation new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newInitializer [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaInitializer new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newIntTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaIntTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newIntegerLiteral [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaIntegerLiteral new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newInterfaceDeclaration [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaInterfaceDeclaration new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newLabeledCaseStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaLabeledCaseStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newLabeledStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaLabeledStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newLambdaExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaLambdaExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newLiteral [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaLiteral new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newLongLiteral [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaLongLiteral new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newLongTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaLongTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newMethodEntity [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaMethodEntity new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newMethodInvocation [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaMethodInvocation new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newMethodReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaMethodReference new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newModifier [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaModifier new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newNewArray [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaNewArray new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newNewClassExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaNewClassExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newNewExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaNewExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newNullLiteral [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaNullLiteral new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newOuterThis [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaOuterThis new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newPackageDeclaration [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaPackageDeclaration new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newParameter [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaParameter new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newPrimitiveTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaPrimitiveTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newQualifiedName [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaQualifiedName new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newQualifiedTypeName [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaQualifiedTypeName new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newRecordDeclaration [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaRecordDeclaration new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newReturnStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaReturnStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newShortTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaShortTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newStatementBlock [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaStatementBlock new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newStringLiteral [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaStringLiteral new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newSwitchExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaSwitchExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newSwitchLabel [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaSwitchLabel new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newSwitchRule [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaSwitchRule new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newSwitchStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaSwitchStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newSynchronizedStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaSynchronizedStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newThis [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaThis new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newThrowStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaThrowStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newTryCatchStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaTryCatchStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newTypeName [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaTypeName new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newTypeParameterExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaTypeParameterExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newTypePattern [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaTypePattern new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newUnaryExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaUnaryExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newVarDeclStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaVarDeclStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newVarTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaVarTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newVariableDeclarator [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaVariableDeclarator new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newVariableExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaVariableExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newVoidTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaVoidTypeExpression new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newWhileStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaWhileStatement new
]

{ #category : 'entity creation' }
FASTJavaTEntityCreator >> newYieldStatement [

	<ignoreForCoverage>
	<generated>
	^ self add: FASTJavaYieldStatement new
]
