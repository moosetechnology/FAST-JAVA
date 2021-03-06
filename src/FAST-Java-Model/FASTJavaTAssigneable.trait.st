"
You can assign something to me
example:

this.hello = ""hello""
"
Trait {
	#name : #FASTJavaTAssigneable,
	#instVars : [
		'#javaVariableAssignementOwner => FMOne type: #FASTJavaTWithAssigneable opposite: #variable'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTAssigneable classSide >> annotation [

	<FMClass: #TAssigneable super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaTAssigneable >> javaVariableAssignementOwner [
	"Relation named: #javaVariableAssignementOwner type: #FASTJavaTWithAssigneable opposite: #variable"

	<generated>
	<FMComment: 'The owner of the modifier'>
	<container>
	<derived>
	^ javaVariableAssignementOwner
]

{ #category : #accessing }
FASTJavaTAssigneable >> javaVariableAssignementOwner: anObject [

	<generated>
	javaVariableAssignementOwner := anObject
]

{ #category : #navigation }
FASTJavaTAssigneable >> javaVariableAssignementOwnerGroup [
	<generated>
	<navigation: 'JavaVariableAssignementOwner'>
	^ MooseSpecializedGroup with: self javaVariableAssignementOwner
]
