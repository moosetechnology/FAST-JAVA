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
	#traits : 'FASTJavaTDeclaration + FamixTWithImmediateSource',
	#classTraits : 'FASTJavaTDeclaration classTrait + FamixTWithImmediateSource classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaInitializer class >> annotation [

	<MSEClass: #Initializer super: #FASTScopableEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #meta }
FASTJavaInitializer class >> requirements [

	<generated>
	^ { FASTJavaClassDeclaration }
]

{ #category : #accessing }
FASTJavaInitializer >> statementBlock [
	"Relation named: #statementBlock type: #FASTJavaStatementBlock opposite: #javaInitializerOwner"

	<generated>
	<MSEComment: 'Statements block of the behavioural entity'>
	<MSEProperty: #statementBlock type: #Object>
	<package: #'Carrefour-Model'>
	^ self privateState attributeAt: #statementBlock ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaInitializer >> statementBlock: anObject [

	<generated>
	(self privateState attributeAt: #statementBlock ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self statementBlock.
		self privateState attributeAt: #statementBlock put: anObject.
		otherSide javaInitializerOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #statementBlock put: anObject.
		anObject javaInitializerOwner: self ]
]

{ #category : #navigation }
FASTJavaInitializer >> statementBlockGroup [
	<generated>
	<navigation: 'StatementBlock'>
	^ MooseGroup with: self statementBlock
]
