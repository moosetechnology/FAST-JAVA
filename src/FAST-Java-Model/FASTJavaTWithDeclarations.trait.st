"
I have declarations
"
Trait {
	#name : #FASTJavaTWithDeclarations,
	#instVars : [
		'#declarations => FMMany type: #FASTJavaTDeclaration opposite: #javaDeclarationOwner'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTWithDeclarations classSide >> annotation [

	<MSEClass: #TWithDeclarations super: #Trait>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaTWithDeclarations >> addDeclarations: anObject [
	<generated>
	^ self declarations add: anObject
]

{ #category : #accessing }
FASTJavaTWithDeclarations >> declarations [
	"Relation named: #declarations type: #FASTJavaTDeclaration opposite: #javaDeclarationOwner"

	<generated>
	<MSEComment: 'The element I declared'>
	^ declarations
]

{ #category : #accessing }
FASTJavaTWithDeclarations >> declarations: anObject [

	<generated>
	declarations value: anObject

]

{ #category : #navigation }
FASTJavaTWithDeclarations >> declarationsGroup [
	<generated>
	<navigation: 'Declarations'>
	^ MooseGroup withAll: self declarations asSet
]
