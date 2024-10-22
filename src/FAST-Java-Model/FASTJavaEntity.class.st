"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `javaLambdaExpressionOwner` | `FASTTEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FASTTWithComments` | `container` | `FASTTComment` | list of comments defined in the entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaEntity',
	#superclass : 'MooseEntity',
	#traits : 'FASTTEntity + FASTTWithComments',
	#classTraits : 'FASTTEntity classTrait + FASTTWithComments classTrait',
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FASTJavaEntity class >> isAbstract [

	<generated>
	^ self == FASTJavaEntity
]

{ #category : 'meta' }
FASTJavaEntity class >> metamodel [

	<generated>
	^ FASTJavaModel metamodel
]

{ #category : 'testing' }
FASTJavaEntity >> isAnnotation [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isArrayAccess [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isArrayAnnotationElement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isArrayInitializer [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isArrayTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isAssignmentExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isBehaviouralEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isBooleanLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isBooleanTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isBreakStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isByteTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCaseStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCastExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCatchPartStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCharTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCharacterLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isClassDeclaration [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isClassProperty [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isClassTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCompilationUnit [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isConditionalExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isContinueStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isDefaultCaseStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isDoWhileStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isDoubleTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isEmptyDimExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isEmptyMethodDeclaration [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isEnumConstant [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isEnumDeclaration [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isExpressionStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isFieldAccess [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isFloatTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isForEachStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isForStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isIdentifier [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isIfStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isImportDeclaration [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isInfixOperation [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isInitializer [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isIntTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isInterfaceDeclaration [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLabeledCaseStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLabeledStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLambdaExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLongTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isMethodEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isMethodReference [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isModifier [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isNewArray [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isNewClassExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isNewExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isNullPointerLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isOuterThis [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isPackageDeclaration [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isParameter [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isPrimitiveTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isQualifiedName [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isQualifiedTypeName [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isReturnStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isScopableEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isShortTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isStatementBlock [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isStringLiteral [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isSwitchStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isSynchronizedStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isThis [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isThrowStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isTryCatchStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isTypeName [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isTypeParameterExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isTypePattern [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVarDeclStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVariableDeclarator [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVariableEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVariableExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVoidTypeExpression [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isWhileStatement [

	<generated>
	^ false
]
