"
A node of a for loop statement.

eg.
for(Patate p : list) {
...
}
"
Class {
	#name : #FASTJavaForEachStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'#fieldname => FMOne type: #FASTJavaVariableExpression opposite: #javaForEachStatementFieldNameOwner',
		'#type => FMOne type: #FASTJavaVariableExpression opposite: #javaForEachStatementTypeOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaForEachStatement class >> annotation [

	<MSEClass: #ForEachStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaForEachStatement >> body [
	"Relation named: #body type: #FASTJavaStatement opposite: #javaForEachStatementOwner"

	<generated>
	<MSEComment: 'The body of the For Each statement'>
	<MSEProperty: #body type: #Object>
	^ self privateState attributeAt: #body ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForEachStatement >> body: anObject [

	<generated>
	(self privateState attributeAt: #body ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self body.
		self privateState attributeAt: #body put: anObject.
		otherSide javaForEachStatementOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #body put: anObject.
		anObject javaForEachStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaForEachStatement >> bodyGroup [
	<generated>
	<navigation: 'Body'>
	^ MooseGroup with: self body
]

{ #category : #accessing }
FASTJavaForEachStatement >> fieldname [
	"Relation named: #fieldname type: #FASTJavaVariableExpression opposite: #javaForEachStatementFieldNameOwner"

	<generated>
	<MSEComment: 'The name of the created local variable'>
	^ fieldname
]

{ #category : #accessing }
FASTJavaForEachStatement >> fieldname: anObject [

	<generated>
	fieldname := anObject

]

{ #category : #navigation }
FASTJavaForEachStatement >> fieldnameGroup [
	<generated>
	<navigation: 'Fieldname'>
	^ MooseGroup with: self fieldname
]

{ #category : #accessing }
FASTJavaForEachStatement >> list [
	"Relation named: #list type: #FASTJavaExpression opposite: #javaForEachStatementOwner"

	<generated>
	<MSEComment: 'The list the for each statement iterate on'>
	<MSEProperty: #list type: #Object>
	^ self privateState attributeAt: #list ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForEachStatement >> list: anObject [

	<generated>
	(self privateState attributeAt: #list ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self list.
		self privateState attributeAt: #list put: anObject.
		otherSide javaForEachStatementOwner: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #list put: anObject.
		anObject javaForEachStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaForEachStatement >> listGroup [
	<generated>
	<navigation: 'List'>
	^ MooseGroup with: self list
]

{ #category : #accessing }
FASTJavaForEachStatement >> type [
	"Relation named: #type type: #FASTJavaVariableExpression opposite: #javaForEachStatementTypeOwner"

	<generated>
	<MSEComment: 'The name of the type of the created local variable'>
	^ type
]

{ #category : #accessing }
FASTJavaForEachStatement >> type: anObject [

	<generated>
	type := anObject

]

{ #category : #navigation }
FASTJavaForEachStatement >> typeGroup [
	<generated>
	<navigation: 'Type'>
	^ MooseGroup with: self type
]
