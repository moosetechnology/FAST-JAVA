"
I have a qualified name.
"
Trait {
	#name : #FASTJavaTWithQualifiedName,
	#instVars : [
		'#qualifiedName => FMOne type: #FASTJavaQualifiedName opposite: #qualifiedNameOwner'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTWithQualifiedName classSide >> annotation [

	<FMClass: #TWithQualifiedName super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaTWithQualifiedName >> qualifiedName [
	"Relation named: #qualifiedName type: #FASTJavaQualifiedName opposite: #qualifiedNameOwner"

	<generated>
	<FMComment: 'The name that qualifies me'>
	^ qualifiedName
]

{ #category : #accessing }
FASTJavaTWithQualifiedName >> qualifiedName: anObject [

	<generated>
	qualifiedName := anObject
]

{ #category : #navigation }
FASTJavaTWithQualifiedName >> qualifiedNameGroup [
	<generated>
	<navigation: 'QualifiedName'>
	^ MooseSpecializedGroup with: self qualifiedName
]
