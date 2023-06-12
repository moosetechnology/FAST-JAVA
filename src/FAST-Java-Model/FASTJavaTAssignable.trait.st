"
You can assign something to me
example:

this.hello = ""hello""
"
Trait {
	#name : #FASTJavaTAssignable,
	#instVars : [
		'#javaVariableAssignmentOwner => FMOne type: #FASTJavaTWithAssignable opposite: #variable'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTAssignable classSide >> annotation [

	<FMClass: #TAssignable super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaTAssignable >> javaVariableAssignmentOwner [
	"Relation named: #javaVariableAssignmentOwner type: #FASTJavaTWithAssignable opposite: #variable"

	<generated>
	<FMComment: 'The owner of the assignment'>
	<container>
	<derived>
	^ javaVariableAssignmentOwner
]

{ #category : #accessing }
FASTJavaTAssignable >> javaVariableAssignmentOwner: anObject [

	<generated>
	javaVariableAssignmentOwner := anObject
]

{ #category : #navigation }
FASTJavaTAssignable >> javaVariableAssignmentOwnerGroup [
	<generated>
	<navigation: 'JavaVariableAssignmentOwner'>
	^ MooseSpecializedGroup with: self javaVariableAssignmentOwner
]
