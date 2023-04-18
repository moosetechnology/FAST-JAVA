"
I have an assignable
"
Trait {
	#name : #FASTJavaTWithAssignable,
	#instVars : [
		'#variable => FMOne type: #FASTJavaTAssignable opposite: #javaVariableAssignmentOwner'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTWithAssignable classSide >> annotation [

	<FMClass: #TWithAssignable super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaTWithAssignable >> variable [
	"Relation named: #variable type: #FASTJavaTAssignable opposite: #javaVariableAssignmentOwner"

	<generated>
	<FMComment: 'My variable'>
	^ variable
]

{ #category : #accessing }
FASTJavaTWithAssignable >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : #navigation }
FASTJavaTWithAssignable >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseSpecializedGroup with: self variable
]
