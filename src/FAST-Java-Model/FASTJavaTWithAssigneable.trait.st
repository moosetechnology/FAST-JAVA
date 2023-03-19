"
I have an assigneable
"
Trait {
	#name : #FASTJavaTWithAssigneable,
	#instVars : [
		'#variable => FMOne type: #FASTJavaTAssigneable opposite: #javaVariableAssignementOwner'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTWithAssigneable classSide >> annotation [

	<FMClass: #TWithAssigneable super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaTWithAssigneable >> variable [
	"Relation named: #variable type: #FASTJavaTAssigneable opposite: #javaVariableAssignementOwner"

	<generated>
	<FMComment: 'My variable'>
	^ variable
]

{ #category : #accessing }
FASTJavaTWithAssigneable >> variable: anObject [

	<generated>
	variable := anObject
]

{ #category : #navigation }
FASTJavaTWithAssigneable >> variableGroup [
	<generated>
	<navigation: 'Variable'>
	^ MooseSpecializedGroup with: self variable
]
