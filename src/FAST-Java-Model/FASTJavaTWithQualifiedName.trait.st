"
I have a qualified name.

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `qualifiedName` | `FASTJavaTWithQualifiedName` | `qualifiedNameOwner` | `FASTJavaQualifiedName` | The name that qualifies me|



"
Trait {
	#name : 'FASTJavaTWithQualifiedName',
	#instVars : [
		'#qualifiedName => FMOne type: #FASTJavaQualifiedName opposite: #qualifiedNameOwner'
	],
	#category : 'FAST-Java-Model-Traits',
	#package : 'FAST-Java-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTJavaTWithQualifiedName classSide >> annotation [

	<FMClass: #TWithQualifiedName super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaTWithQualifiedName >> qualifiedName [
	"Relation named: #qualifiedName type: #FASTJavaQualifiedName opposite: #qualifiedNameOwner"

	<generated>
	<FMComment: 'The name that qualifies me'>
	^ qualifiedName
]

{ #category : 'accessing' }
FASTJavaTWithQualifiedName >> qualifiedName: anObject [

	<generated>
	qualifiedName := anObject
]
