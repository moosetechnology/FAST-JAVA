"
I am a visitor for FASTJavaEntities. 
I am generated with the metamodel.


"
Trait {
	#name : 'FASTJavaTVisitor',
	#category : 'FAST-Java-Visitor-Visitor',
	#package : 'FAST-Java-Visitor',
	#tag : 'Visitor'
}

{ #category : 'meta' }
FASTJavaTVisitor classSide >> annotation [

	<FMClass: #TVisitor super: #Object>
	<package: #'FAST-Java-Visitor'>
	<generated>
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitCollection: aCollection [

	<generated>
	^ aCollection collect: [ :each | each accept: self ]
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitEntity: aFamixEntity [

	<generated>
	^ aFamixEntity ifNotNil: [ aFamixEntity accept: self ]
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaAnnotation: anAnnotation [

	<generated>
	self visitFASTJavaTAnnotationElement: anAnnotation.
	self visitFASTJavaTModifier: anAnnotation.
	self visitFASTTNamedEntity: anAnnotation.

	self visitCollection: anAnnotation elements
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaArrayAccess: anArrayAccess [

	<generated>
	self visitFASTJavaTAssignable: anArrayAccess.
	self visitFASTJavaTReceiver: anArrayAccess.
	self visitFASTTExpression: anArrayAccess.

	self visitEntity: anArrayAccess expression.
	self visitEntity: anArrayAccess array
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaArrayAnnotationElement: anArrayAnnotationElement [

	<generated>
	self visitFASTJavaTAnnotationElement: anArrayAnnotationElement.
	self visitFASTTExpression: anArrayAnnotationElement.

	self visitCollection: anArrayAnnotationElement values
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaArrayInitializer: anArrayInitializer [

	<generated>
	self visitFASTJavaTAnnotationElement: anArrayInitializer.
	self visitFASTTExpression: anArrayInitializer.

	self visitCollection: anArrayInitializer initializers
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaArrayTypeExpression: anArrayTypeExpression [

	<generated>
	self visitFASTJavaTypeExpression: anArrayTypeExpression.

	self visitEntity: anArrayTypeExpression baseType
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaAssertStatement: anAssertStatement [

	<generated>
	self visitFASTTStatement: anAssertStatement.

	self visitEntity: anAssertStatement condition.
	self visitEntity: anAssertStatement message
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaAssignmentExpression: anAssignmentExpression [

	<generated>
	self visitFASTJavaTAnnotationElement: anAssignmentExpression.
	self visitFASTJavaTReceiver: anAssignmentExpression.
	self visitFASTJavaTWithAssignable: anAssignmentExpression.
	self visitFASTTExpression: anAssignmentExpression.

	self visitEntity: anAssignmentExpression expression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaBooleanLiteral: aBooleanLiteral [

	<generated>
	self visitFASTTBooleanLiteral: aBooleanLiteral.
	self visitFASTJavaLiteral: aBooleanLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaBooleanTypeExpression: aBooleanTypeExpression [

	<generated>
	self visitFASTJavaPrimitiveTypeExpression: aBooleanTypeExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaBreakStatement: aBreakStatement [

	<generated>
	self visitFASTTStatement: aBreakStatement
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaByteTypeExpression: aByteTypeExpression [

	<generated>
	self visitFASTJavaPrimitiveTypeExpression: aByteTypeExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaCaseStatement: aCaseStatement [

	<generated>
	self visitFASTTStatementBlock: aCaseStatement.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaCastExpression: aCastExpression [

	<generated>
	self visitFASTJavaTReceiver: aCastExpression.
	self visitFASTTExpression: aCastExpression.

	self visitEntity: aCastExpression expression.
	self visitEntity: aCastExpression type
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaCatchPartStatement: aCatchPartStatement [

	<generated>
	self visitFASTTStatement: aCatchPartStatement.

	self visitEntity: aCatchPartStatement body.
	self visitCollection: aCatchPartStatement catchedTypes.
	self visitEntity: aCatchPartStatement parameter
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaCharTypeExpression: aCharTypeExpression [

	<generated>
	self visitFASTJavaPrimitiveTypeExpression: aCharTypeExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaCharacterLiteral: aCharacterLiteral [

	<generated>
	self visitFASTTCharacterLiteral: aCharacterLiteral.
	self visitFASTJavaLiteral: aCharacterLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaClassDeclaration: aClassDeclaration [

	<generated>
	self visitFASTJavaTDeclaration: aClassDeclaration.
	self visitFASTJavaTWithDeclarations: aClassDeclaration.
	self visitFASTJavaTWithModifiers: aClassDeclaration.
	self visitFASTTNamedEntity: aClassDeclaration.
	self visitFASTTStatement: aClassDeclaration.
	self visitFamixTHasImmediateSource: aClassDeclaration.

	self visitEntity: aClassDeclaration superclass.
	self visitCollection: aClassDeclaration interfaces
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaClassProperty: aClassProperty [

	<generated>
	self visitFASTJavaTAnnotationElement: aClassProperty.
	self visitFASTJavaTReceiver: aClassProperty.
	self visitFASTJavaVariableExpression: aClassProperty.

	self visitEntity: aClassProperty type
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaClassTypeExpression: aClassTypeExpression [

	<generated>
	self visitFASTTWithArguments: aClassTypeExpression.
	self visitFASTJavaTypeExpression: aClassTypeExpression.

	self visitEntity: aClassTypeExpression typeName
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaComment: aComment [

	<generated>
	self visitFASTTComment: aComment
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaCompilationUnit: aCompilationUnit [

	<generated>
	self visitFASTTEntity: aCompilationUnit.

	self visitEntity: aCompilationUnit packageDeclaration.
	self visitCollection: aCompilationUnit importDeclarations.
	self visitCollection: aCompilationUnit classDeclarations.
	self visitCollection: aCompilationUnit interfaceDeclarations.
	self visitCollection: aCompilationUnit enumDeclarations
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaConditionalExpression: aConditionalExpression [

	<generated>
	self visitFASTJavaTReceiver: aConditionalExpression.
	self visitFASTTExpression: aConditionalExpression.

	self visitEntity: aConditionalExpression condition.
	self visitEntity: aConditionalExpression elsePart.
	self visitEntity: aConditionalExpression thenPart
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaContinueStatement: aContinueStatement [

	<generated>
	self visitFASTTStatement: aContinueStatement
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaDefaultCaseStatement: aDefaultCaseStatement [

	<generated>
	self visitFASTJavaCaseStatement: aDefaultCaseStatement
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaDoWhileStatement: aDoWhileStatement [

	<generated>
	self visitFASTTConditionalStatement: aDoWhileStatement.
	self visitFASTTLoopStatement: aDoWhileStatement.
	self visitFASTTStatement: aDoWhileStatement
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaDoubleLiteral: aDoubleLiteral [

	<generated>
	self visitFASTTLiteral: aDoubleLiteral.
	self visitFASTJavaLiteral: aDoubleLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaDoubleTypeExpression: aDoubleTypeExpression [

	<generated>
	self visitFASTJavaPrimitiveTypeExpression: aDoubleTypeExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaEmptyDimExpression: anEmptyDimExpression [

	<generated>
	self visitFASTTExpression: anEmptyDimExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaEmptyMethodDeclaration: anEmptyMethodDeclaration [

	<generated>
	self visitFASTJavaMethodEntity: anEmptyMethodDeclaration
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaEntity: anEntity [

	<generated>
	self visitFASTTEntity: anEntity.
	self visitFASTTWithComments: anEntity.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaEnumConstant: anEnumConstant [

	<generated>
	self visitFASTJavaVariableExpression: anEnumConstant.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaEnumDeclaration: anEnumDeclaration [

	<generated>
	self visitFASTJavaTDeclaration: anEnumDeclaration.
	self visitFASTJavaTWithDeclarations: anEnumDeclaration.
	self visitFASTJavaTWithModifiers: anEnumDeclaration.
	self visitFASTTNamedEntity: anEnumDeclaration.
	self visitFASTTStatement: anEnumDeclaration.
	self visitFamixTHasImmediateSource: anEnumDeclaration.

	self visitCollection: anEnumDeclaration interfaces.
	self visitCollection: anEnumDeclaration constants
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaExpressionStatement: anExpressionStatement [

	<generated>
	self visitFASTTExpressionStatement: anExpressionStatement
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaFieldAccess: aFieldAccess [

	<generated>
	self visitFASTJavaTAssignable: aFieldAccess.
	self visitFASTJavaTReceiver: aFieldAccess.
	self visitFASTJavaTWithReceiver: aFieldAccess.
	self visitFASTTExpression: aFieldAccess
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaFloatLiteral: aFloatLiteral [

	<generated>
	self visitFASTTLiteral: aFloatLiteral.
	self visitFASTJavaLiteral: aFloatLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaFloatTypeExpression: aFloatTypeExpression [

	<generated>
	self visitFASTJavaPrimitiveTypeExpression: aFloatTypeExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaForEachStatement: aForEachStatement [

	<generated>
	self visitFASTTLoopStatement: aForEachStatement.
	self visitFASTTStatement: aForEachStatement.

	self visitEntity: aForEachStatement list.
	self visitEntity: aForEachStatement fieldname.
	self visitEntity: aForEachStatement type
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaForStatement: aForStatement [

	<generated>
	self visitFASTTConditionalStatement: aForStatement.
	self visitFASTTLoopStatement: aForStatement.
	self visitFASTTStatement: aForStatement.

	self visitEntity: aForStatement incrementor.
	self visitEntity: aForStatement initializer
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaIdentifier: anIdentifier [

	<generated>
	self visitFASTJavaTReceiver: anIdentifier.
	self visitFASTJavaVariableExpression: anIdentifier.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaIfStatement: anIfStatement [

	<generated>
	self visitFASTTConditionalStatement: anIfStatement.
	self visitFASTTStatement: anIfStatement.

	self visitEntity: anIfStatement elsePart.
	self visitEntity: anIfStatement thenPart
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaImportDeclaration: anImportDeclaration [

	<generated>
	self visitFASTJavaTWithQualifiedName: anImportDeclaration.
	self visitFASTTEntity: anImportDeclaration.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaInfixOperation: anInfixOperation [

	<generated>
	self visitFASTJavaTAnnotationElement: anInfixOperation.
	self visitFASTJavaTReceiver: anInfixOperation.
	self visitFASTTExpression: anInfixOperation.

	self visitEntity: anInfixOperation leftOperand.
	self visitEntity: anInfixOperation rightOperand
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaInitializer: anInitializer [

	<generated>
	self visitFASTJavaTDeclaration: anInitializer.
	self visitFASTTScopableEntity: anInitializer.
	self visitFamixTHasImmediateSource: anInitializer.

	self visitEntity: anInitializer statementBlock
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaIntTypeExpression: anIntTypeExpression [

	<generated>
	self visitFASTJavaPrimitiveTypeExpression: anIntTypeExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaIntegerLiteral: anIntegerLiteral [

	<generated>
	self visitFASTTLiteral: anIntegerLiteral.
	self visitFASTJavaLiteral: anIntegerLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaInterfaceDeclaration: anInterfaceDeclaration [

	<generated>
	self visitFASTJavaTDeclaration: anInterfaceDeclaration.
	self visitFASTJavaTWithDeclarations: anInterfaceDeclaration.
	self visitFASTJavaTWithModifiers: anInterfaceDeclaration.
	self visitFASTTNamedEntity: anInterfaceDeclaration.
	self visitFASTTStatement: anInterfaceDeclaration.
	self visitFamixTHasImmediateSource: anInterfaceDeclaration.

	self visitCollection: anInterfaceDeclaration interfaces
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaLabeledCaseStatement: aLabeledCaseStatement [

	<generated>
	self visitFASTJavaCaseStatement: aLabeledCaseStatement.

	self visitEntity: aLabeledCaseStatement label
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaLabeledStatement: aLabeledStatement [

	<generated>
	self visitFASTTStatement: aLabeledStatement.

	self visitEntity: aLabeledStatement labeledStatement
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaLambdaExpression: aLambdaExpression [

	<generated>
	self visitFASTTExpression: aLambdaExpression.
	self visitFASTTWithParameters: aLambdaExpression.

	self visitEntity: aLambdaExpression expression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaLiteral: aLiteral [

	<generated>
	self visitFASTJavaTAnnotationElement: aLiteral.
	self visitFASTJavaTReceiver: aLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaLongLiteral: aLongLiteral [

	<generated>
	self visitFASTTLiteral: aLongLiteral.
	self visitFASTJavaLiteral: aLongLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaLongTypeExpression: aLongTypeExpression [

	<generated>
	self visitFASTJavaPrimitiveTypeExpression: aLongTypeExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaMethodEntity: aMethodEntity [

	<generated>
	self visitFASTJavaTDeclaration: aMethodEntity.
	self visitFASTJavaTWithModifiers: aMethodEntity.
	self visitFASTTNamedBehaviouralEntity: aMethodEntity.
	self visitFamixTHasImmediateSource: aMethodEntity.

	self visitEntity: aMethodEntity type.
	self visitCollection: aMethodEntity throws.
	self visitCollection: aMethodEntity typeParameters
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaMethodInvocation: aMethodInvocation [

	<generated>
	self visitFASTJavaTReceiver: aMethodInvocation.
	self visitFASTJavaTWithReceiver: aMethodInvocation.
	self visitFASTTInvocation: aMethodInvocation.
	self visitFASTTNamedEntity: aMethodInvocation
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaMethodReference: aMethodReference [

	<generated>
	self visitFASTTExpression: aMethodReference.
	self visitFASTTNamedEntity: aMethodReference.

	self visitEntity: aMethodReference receiver
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaModifier: aModifier [

	<generated>
	self visitFASTJavaTModifier: aModifier.
	self visitFASTTExpression: aModifier
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaNewArray: aNewArray [

	<generated>
	self visitFASTJavaNewExpression: aNewArray.

	self visitEntity: aNewArray initializer
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaNewClassExpression: aNewClassExpression [

	<generated>
	self visitFASTJavaTWithDeclarations: aNewClassExpression.
	self visitFASTTWithArguments: aNewClassExpression.
	self visitFASTJavaNewExpression: aNewClassExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaNewExpression: aNewExpression [

	<generated>
	self visitFASTJavaTReceiver: aNewExpression.
	self visitFASTJavaTWithReceiver: aNewExpression.
	self visitFASTTExpression: aNewExpression.
	self visitFASTTWithArguments: aNewExpression.

	self visitEntity: aNewExpression type
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaNullLiteral: aNullLiteral [

	<generated>
	self visitFASTTNullPointerLiteral: aNullLiteral.
	self visitFASTJavaLiteral: aNullLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaOuterThis: anOuterThis [

	<generated>
	self visitFASTJavaTReceiver: anOuterThis.
	self visitFASTTExpression: anOuterThis.

	self visitEntity: anOuterThis type
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaPackageDeclaration: aPackageDeclaration [

	<generated>
	self visitFASTJavaTWithQualifiedName: aPackageDeclaration.
	self visitFASTTEntity: aPackageDeclaration.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaParameter: aParameter [

	<generated>
	self visitFASTTExpression: aParameter.
	self visitFASTTVariableEntity: aParameter.

	self visitEntity: aParameter type.
	self visitEntity: aParameter variable
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaPrimitiveTypeExpression: aPrimitiveTypeExpression [

	<generated>
	self visitFASTJavaTypeExpression: aPrimitiveTypeExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaQualifiedName: aQualifiedName [

	<generated>
	self visitFASTJavaTAssignable: aQualifiedName.
	self visitFASTTEntity: aQualifiedName.
	self visitFASTTNamedEntity: aQualifiedName.

	self visitEntity: aQualifiedName namespace
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaQualifiedTypeName: aQualifiedTypeName [

	<generated>
	self visitFASTJavaTypeName: aQualifiedTypeName.

	self visitEntity: aQualifiedTypeName namespace
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaReturnStatement: aReturnStatement [

	<generated>
	self visitFASTTReturnStatement: aReturnStatement
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaShortTypeExpression: aShortTypeExpression [

	<generated>
	self visitFASTJavaPrimitiveTypeExpression: aShortTypeExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaStatement: aStatement [

	<generated>
	self visitFASTTStatement: aStatement
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaStatementBlock: aStatementBlock [

	<generated>
	self visitFASTTStatementBlock: aStatementBlock.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaStringLiteral: aStringLiteral [

	<generated>
	self visitFASTTStringLiteral: aStringLiteral.
	self visitFASTJavaLiteral: aStringLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaSwitchStatement: aSwitchStatement [

	<generated>
	self visitFASTTStatement: aSwitchStatement.

	self visitCollection: aSwitchStatement cases.
	self visitEntity: aSwitchStatement condition
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaSynchronizedStatement: aSynchronizedStatement [

	<generated>
	self visitFASTTStatement: aSynchronizedStatement.

	self visitEntity: aSynchronizedStatement expression.
	self visitEntity: aSynchronizedStatement block
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTAnnotationElement: aTAnnotationElement [

	<generated>

]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTAssignable: aTAssignable [

	<generated>

]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTDeclaration: aTDeclaration [

	<generated>

]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTModifier: aTModifier [

	<generated>

]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTReceiver: aTReceiver [

	<generated>

]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTWithAssignable: aTWithAssignable [

	<generated>
	self visitEntity: aTWithAssignable variable
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTWithDeclarations: aTWithDeclarations [

	<generated>
	self visitCollection: aTWithDeclarations declarations
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTWithModifiers: aTWithModifiers [

	<generated>
	self visitCollection: aTWithModifiers modifiers
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTWithQualifiedName: aTWithQualifiedName [

	<generated>
	self visitEntity: aTWithQualifiedName qualifiedName
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTWithReceiver: aTWithReceiver [

	<generated>
	self visitEntity: aTWithReceiver receiver
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaThis: aThis [

	<generated>
	self visitFASTJavaVariableExpression: aThis
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaThrowStatement: aThrowStatement [

	<generated>
	self visitFASTTStatement: aThrowStatement.

	self visitEntity: aThrowStatement expression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTryCatchStatement: aTryCatchStatement [

	<generated>
	self visitFASTTStatement: aTryCatchStatement.

	self visitEntity: aTryCatchStatement try.
	self visitCollection: aTryCatchStatement catches.
	self visitEntity: aTryCatchStatement finally.
	self visitCollection: aTryCatchStatement resources
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTypeExpression: aTypeExpression [

	<generated>
	self visitFASTJavaVariableExpression: aTypeExpression.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTypeName: aTypeName [

	<generated>
	self visitFASTJavaTAnnotationElement: aTypeName.
	self visitFASTTExpression: aTypeName.
	self visitFASTTNamedEntity: aTypeName.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTypeParameterExpression: aTypeParameterExpression [

	<generated>
	self visitFASTTExpression: aTypeParameterExpression.
	self visitFASTTNamedEntity: aTypeParameterExpression.

	self visitCollection: aTypeParameterExpression types
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaTypePattern: aTypePattern [

	<generated>
	self visitFASTTExpression: aTypePattern.

	self visitEntity: aTypePattern variable.
	self visitEntity: aTypePattern type
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaUnaryExpression: anUnaryExpression [

	<generated>
	self visitFASTTExpression: anUnaryExpression.

	self visitEntity: anUnaryExpression expression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaVarDeclStatement: aVarDeclStatement [

	<generated>
	self visitFASTJavaTDeclaration: aVarDeclStatement.
	self visitFASTJavaTWithModifiers: aVarDeclStatement.
	self visitFASTTScopableEntity: aVarDeclStatement.
	self visitFASTTStatement: aVarDeclStatement.

	self visitCollection: aVarDeclStatement declarators.
	self visitEntity: aVarDeclStatement type
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaVarTypeExpression: aVarTypeExpression [

	<generated>

]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaVariableDeclarator: aVariableDeclarator [

	<generated>
	self visitFASTTEntity: aVariableDeclarator.

	self visitEntity: aVariableDeclarator expression.
	self visitEntity: aVariableDeclarator variable
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaVariableExpression: aVariableExpression [

	<generated>
	self visitFASTJavaTAssignable: aVariableExpression.
	self visitFASTJavaTReceiver: aVariableExpression.
	self visitFASTTVariableExpression: aVariableExpression.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaVoidTypeExpression: aVoidTypeExpression [

	<generated>
	self visitFASTJavaPrimitiveTypeExpression: aVoidTypeExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTJavaWhileStatement: aWhileStatement [

	<generated>
	self visitFASTTConditionalStatement: aWhileStatement.
	self visitFASTTLoopStatement: aWhileStatement.
	self visitFASTTStatement: aWhileStatement
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTBehaviouralEntity: aTBehaviouralEntity [

	<generated>
	self visitFASTTScopableEntity: aTBehaviouralEntity.
	self visitFASTTWithParameters: aTBehaviouralEntity.
	self visitFASTTWithStatements: aTBehaviouralEntity
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTBooleanLiteral: aTBooleanLiteral [

	<generated>
	self visitFASTTLiteral: aTBooleanLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTCharacterLiteral: aTCharacterLiteral [

	<generated>
	self visitFASTTLiteral: aTCharacterLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTComment: aTComment [

	<generated>

]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTConditionalStatement: aTConditionalStatement [

	<generated>
	self visitFASTTStatement: aTConditionalStatement.
	self visitFASTTWithCondition: aTConditionalStatement
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTEntity: aTEntity [

	<generated>
	"We should visit TEntityMetaLevelDependency but all its users in this language already visit it in their superclasses so we skip the call here."
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTExpression: aTExpression [

	<generated>
	"We should visit FASTTEntity but all its users in this language already visit it in their superclasses so we skip the call here.".


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTExpressionStatement: aTExpressionStatement [

	<generated>
	self visitFASTTStatement: aTExpressionStatement.

	self visitEntity: aTExpressionStatement expression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTInvocation: aTInvocation [

	<generated>
	self visitFASTTExpression: aTInvocation.
	self visitFASTTWithArguments: aTInvocation.

	self visitEntity: aTInvocation invoked
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTLiteral: aTLiteral [

	<generated>
	self visitFASTTExpression: aTLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTLoopStatement: aTLoopStatement [

	<generated>
	self visitFASTTStatement: aTLoopStatement.

	self visitEntity: aTLoopStatement body
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTNamedBehaviouralEntity: aTNamedBehaviouralEntity [

	<generated>
	self visitFASTTBehaviouralEntity: aTNamedBehaviouralEntity.
	self visitFASTTNamedEntity: aTNamedBehaviouralEntity
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTNamedEntity: aTNamedEntity [

	<generated>
	"We should visit FASTTEntity but all its users in this language already visit it in their superclasses so we skip the call here.".


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTNullPointerLiteral: aTNullPointerLiteral [

	<generated>
	self visitFASTTLiteral: aTNullPointerLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTReturnStatement: aTReturnStatement [

	<generated>
	self visitFASTTStatement: aTReturnStatement.

	self visitEntity: aTReturnStatement expression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTScopableEntity: aTScopableEntity [

	<generated>
	"We should visit FASTTEntity but all its users in this language already visit it in their superclasses so we skip the call here."
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTStatement: aTStatement [

	<generated>
	"We should visit FASTTEntity but all its users in this language already visit it in their superclasses so we skip the call here.".


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTStatementBlock: aTStatementBlock [

	<generated>
	self visitFASTTStatement: aTStatementBlock.

	self visitCollection: aTStatementBlock statements
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTStringLiteral: aTStringLiteral [

	<generated>
	self visitFASTTLiteral: aTStringLiteral
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTVariableEntity: aTVariableEntity [

	<generated>
	self visitFASTTNamedEntity: aTVariableEntity.


]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTVariableExpression: aTVariableExpression [

	<generated>
	self visitFASTTExpression: aTVariableExpression.
	self visitFASTTNamedEntity: aTVariableExpression
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTWithArguments: aTWithArguments [

	<generated>
	self visitCollection: aTWithArguments arguments
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTWithComments: aTWithComments [

	<generated>
	self visitCollection: aTWithComments comments
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTWithCondition: aTWithCondition [

	<generated>
	self visitEntity: aTWithCondition condition
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTWithParameters: aTWithParameters [

	<generated>
	self visitCollection: aTWithParameters parameters
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFASTTWithStatements: aTWithStatements [

	<generated>
	self visitEntity: aTWithStatements statementBlock
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFamixTHasImmediateSource: aTHasImmediateSource [

	<generated>
	self visitFamixTSourceAnchor: aTHasImmediateSource
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitFamixTSourceAnchor: aTSourceAnchor [

	<generated>
	self visitEntity: aTSourceAnchor element
]

{ #category : 'visiting' }
FASTJavaTVisitor >> visitTEntityMetaLevelDependency: aTEntityMetaLevelDependency [

	<generated>

]
