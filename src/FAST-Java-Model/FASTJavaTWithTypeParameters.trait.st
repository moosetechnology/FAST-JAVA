"
I am a generic declaration: I declare type parameters

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeParameters` | `FASTJavaTWithTypeParameters` | `javaTypeParameterOwner` | `FASTJavaTypeParameterExpression` | The type parameters I declare|



"
Trait {
	#name : 'FASTJavaTWithTypeParameters',
	#instVars : [
		'#typeParameters => FMMany type: #FASTJavaTypeParameterExpression opposite: #javaTypeParameterOwner'
	],
	#category : 'FAST-Java-Model-Traits',
	#package : 'FAST-Java-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTJavaTWithTypeParameters classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TWithTypeParameters super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaTWithTypeParameters >> addTypeParameter: anObject [

	<ignoreForCoverage>
	<generated>
	^ self typeParameters add: anObject
]

{ #category : 'accessing' }
FASTJavaTWithTypeParameters >> typeParameters [
	"Relation named: #typeParameters type: #FASTJavaTypeParameterExpression opposite: #javaTypeParameterOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type parameters I declare'>
	<derived>
	^ typeParameters
]

{ #category : 'accessing' }
FASTJavaTWithTypeParameters >> typeParameters: anObject [

	<ignoreForCoverage>
	<generated>
	typeParameters value: anObject
]
