"
I am a declaration in java
"
Trait {
	#name : #FASTJavaTDeclaration,
	#instVars : [
		'#javaDeclarationOwner => FMOne type: #FASTJavaTWithDeclarations opposite: #declarations'
	],
	#category : #'FAST-Java-Model-Traits'
}

{ #category : #meta }
FASTJavaTDeclaration classSide >> annotation [

	<FMClass: #TDeclaration super: #Object>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaTDeclaration >> javaDeclarationOwner [
	"Relation named: #javaDeclarationOwner type: #FASTJavaTWithDeclarations opposite: #declarations"

	<generated>
	<FMComment: 'The element that declared me'>
	<container>
	^ javaDeclarationOwner
]

{ #category : #accessing }
FASTJavaTDeclaration >> javaDeclarationOwner: anObject [

	<generated>
	javaDeclarationOwner := anObject
]

{ #category : #navigation }
FASTJavaTDeclaration >> javaDeclarationOwnerGroup [
	<generated>
	<navigation: 'JavaDeclarationOwner'>
	^ MooseSpecializedGroup with: self javaDeclarationOwner
]
