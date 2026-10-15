"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `javaLambdaExpressionOwner` | `FASTJavaEntity` | `expression` | `FASTJavaLambdaExpression` | The expression owner (if possible)|
| `switchRuleBodyOwner` | `FASTJavaEntity` | `body` | `FASTJavaSwitchRule` | The switch rule whose body I am|

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
	#instVars : [
		'#javaLambdaExpressionOwner => FMOne type: #FASTJavaLambdaExpression opposite: #expression',
		'#switchRuleBodyOwner => FMOne type: #FASTJavaSwitchRule opposite: #body'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FASTJavaEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FASTJavaEntity
]

{ #category : 'meta' }
FASTJavaEntity class >> metamodel [

	<ignoreForCoverage>
	<generated>
	^ FASTJavaModel metamodel
]

{ #category : 'testing' }
FASTJavaEntity >> hasImmediateSource [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isAnnotation [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isArrayAccess [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isArrayAnnotationElement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isArrayInitializer [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isArrayTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isAssignmentExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isBehaviouralEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isBooleanLiteral [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isBooleanTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isBreakStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isByteTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCaseStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCastExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCatchPartStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCharTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCharacterLiteral [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isClassDeclaration [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isClassProperty [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isClassTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isCompilationUnit [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isConditionalExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isContinueStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isDefaultCaseStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isDoWhileStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isDoubleTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isEmptyDimExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isEmptyMethodDeclaration [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isEnumConstant [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isEnumDeclaration [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isExpressionStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isFieldAccess [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isFloatTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isForEachStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isForStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isIdentifier [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isIfStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isImportDeclaration [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isInfixOperation [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isInitializer [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isIntTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isInterfaceDeclaration [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isInvocation [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLabeledCaseStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLabeledStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLambdaExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLiteral [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isLongTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isMethodEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isMethodReference [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isModifier [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isNewArray [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isNewClassExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isNewExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isNullPointerLiteral [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isOuterThis [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isPackageDeclaration [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isParameter [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isPrimitiveTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isQualifiedName [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isQualifiedTypeName [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isReturnStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isScopableEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isShortTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isStatementBlock [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isStringLiteral [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isSwitchExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isSwitchLabel [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isSwitchRule [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isSwitchStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isSynchronizedStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isThis [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isThrowStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isTryCatchStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isTypeName [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isTypeParameterExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isTypePattern [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVarDeclStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVarTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVariableDeclarator [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVariableEntity [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVariableExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isVoidTypeExpression [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isWhileStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'testing' }
FASTJavaEntity >> isYieldStatement [

	<ignoreForCoverage>
	<generated>
	^ false
]

{ #category : 'accessing' }
FASTJavaEntity >> javaLambdaExpressionOwner [
	"Relation named: #javaLambdaExpressionOwner type: #FASTJavaLambdaExpression opposite: #expression"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The expression owner (if possible)'>
	<container>
	<derived>
	^ javaLambdaExpressionOwner
]

{ #category : 'accessing' }
FASTJavaEntity >> javaLambdaExpressionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	javaLambdaExpressionOwner := anObject
]

{ #category : 'accessing' }
FASTJavaEntity >> switchRuleBodyOwner [
	"Relation named: #switchRuleBodyOwner type: #FASTJavaSwitchRule opposite: #body"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The switch rule whose body I am'>
	<container>
	<derived>
	^ switchRuleBodyOwner
]

{ #category : 'accessing' }
FASTJavaEntity >> switchRuleBodyOwner: anObject [

	<ignoreForCoverage>
	<generated>
	switchRuleBodyOwner := anObject
]
