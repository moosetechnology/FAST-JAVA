"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentEnum` | `FASTJavaEnumConstant` | `constants` | `FASTJavaEnumDeclaration` | The enum type that contains me|



"
Class {
	#name : 'FASTJavaEnumConstant',
	#superclass : 'FASTJavaVariableExpression',
	#instVars : [
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
