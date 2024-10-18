"
I have declarations

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `declarations` | `FASTJavaTWithDeclarations` | `javaDeclarationOwner` | `FASTJavaTDeclaration` | The elements I declare|



"
Trait {
	#name : 'FASTJavaTWithDeclarations',
	#instVars : [
		'#declarations => FMMany type: #FASTJavaTDeclaration opposite: #javaDeclarationOwner'
	],
	#category : 'FAST-Java-Model-Traits',
	#package : 'FAST-Java-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTJavaTWithDeclarations classSide >> annotation [

	<FMClass: #TWithDeclarations super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTJavaTWithDeclarations >> addDeclaration: anObject [
	<generated>
	^ self declarations add: anObject
]

{ #category : 'accessing' }
FASTJavaTWithDeclarations >> declarations [
	"Relation named: #declarations type: #FASTJavaTDeclaration opposite: #javaDeclarationOwner"

	<generated>
	<FMComment: 'The elements I declare'>
	<derived>
	^ declarations
]

{ #category : 'accessing' }
FASTJavaTWithDeclarations >> declarations: anObject [

	<generated>
	declarations value: anObject
]

{ #category : 'navigation' }
FASTJavaTWithDeclarations >> declarationsGroup [
	<generated>
	<navigation: 'Declarations'>
	^ MooseSpecializedGroup withAll: self declarations asSet
]
