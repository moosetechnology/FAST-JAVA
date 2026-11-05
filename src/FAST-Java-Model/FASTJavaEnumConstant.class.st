"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentEnum` | `FASTJavaEnumConstant` | `constants` | `FASTJavaEnumDeclaration` | The enum type that contains me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotations` | `FASTJavaTWithAnnotations` | `javaAnnotationOwner` | `FASTJavaAnnotation` | The annotations written on me|
| `arguments` | `FASTTWithArguments` | `argumentOwner` | `FASTTExpression` | My arguments|
| `declarations` | `FASTJavaTWithDeclarations` | `javaDeclarationOwner` | `FASTJavaTDeclaration` | The elements I declare|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `hasParentheses` | `Boolean` | false | Whether parentheses are written after my name, which tells `A()` from `A` when no argument is given (JLS 8.9.1)|

"
Class {
	#name : 'FASTJavaEnumConstant',
	#superclass : 'FASTJavaVariableExpression',
	#traits : 'FASTJavaTWithAnnotations + FASTJavaTWithDeclarations + FASTTWithArguments',
	#classTraits : 'FASTJavaTWithAnnotations classTrait + FASTJavaTWithDeclarations classTrait + FASTTWithArguments classTrait',
	#instVars : [
		'#hasParentheses => FMProperty defaultValue: false',
		'#parentEnum => FMOne type: #FASTJavaEnumDeclaration opposite: #constants'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaEnumConstant class >> annotation [

	<ignoreForCoverage>
	<FMClass: #EnumConstant super: #FASTJavaVariableExpression>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaEnumConstant >> hasParentheses [

	<FMProperty: #hasParentheses type: #Boolean defaultValue: false>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Whether parentheses are written after my name, which tells `A()` from `A` when no argument is given (JLS 8.9.1)'>
	^ hasParentheses ifNil: [ hasParentheses := false ]
]

{ #category : 'accessing' }
FASTJavaEnumConstant >> hasParentheses: anObject [
	<ignoreForCoverage>
	<generated>
	hasParentheses := anObject
]

{ #category : 'testing' }
FASTJavaEnumConstant >> isEnumConstant [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaEnumConstant >> parentEnum [
	"Relation named: #parentEnum type: #FASTJavaEnumDeclaration opposite: #constants"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The enum type that contains me'>
	<container>
	^ parentEnum
]

{ #category : 'accessing' }
FASTJavaEnumConstant >> parentEnum: anObject [

	<ignoreForCoverage>
	<generated>
	parentEnum := anObject
]
