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

	<MSEClass: #TWithAssigneable super: #Trait>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaTWithAssigneable >> variable [
	"Relation named: #variable type: #FASTJavaTAssigneable opposite: #javaVariableAssignementOwner"

	<generated>
	<MSEComment: 'My variable'>
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
	^ MooseGroup with: self variable
]
