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

	<ignoreForCoverage>
	<FMClass: #TWithQualifiedName super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaTWithQualifiedName >> qualifiedName [
	"Relation named: #qualifiedName type: #FASTJavaQualifiedName opposite: #qualifiedNameOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The name that qualifies me'>
	^ qualifiedName
]

{ #category : 'accessing' }
FASTJavaTWithQualifiedName >> qualifiedName: anObject [

	<ignoreForCoverage>
	<generated>
	qualifiedName := anObject
]
