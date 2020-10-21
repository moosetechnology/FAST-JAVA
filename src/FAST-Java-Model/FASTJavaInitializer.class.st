"
I represent a Java initializer
	
ex.:

new Button(){

{ something }

}

"
Class {
	#name : #FASTJavaInitializer,
	#superclass : #FASTScopableEntity,
	#traits : 'FASTJavaTDeclaration + FamixTHasImmediateSource',
	#classTraits : 'FASTJavaTDeclaration classTrait + FamixTHasImmediateSource classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaInitializer class >> annotation [

	<FMClass: #Initializer super: #FASTScopableEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaInitializer >> statementBlock [
	"Relation named: #statementBlock type: #FASTStatementBlock opposite: #javaInitializerOwner"

	<generated>
	<FMComment: 'Statements block of the behavioural entity'>
	<FMProperty: #statementBlock type: #FASTStatementBlock opposite: #javaInitializerOwner>
	^ self attributeAt: #statementBlock ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaInitializer >> statementBlock: anObject [

	<generated>
	(self attributeAt: #statementBlock ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self statementBlock.
		self attributeAt: #statementBlock put: anObject.
		otherSide javaInitializerOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #statementBlock put: anObject.
		anObject javaInitializerOwner: self ]
]

{ #category : #navigation }
FASTJavaInitializer >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseSpecializedGroup with: self statementBlock
]
