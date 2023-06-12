"
A node of a for loop statement.

eg.
for(Patate p : list) {
...
}
"
Class {
	#name : #FASTJavaForEachStatement,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#fieldname => FMOne type: #FASTJavaIdentifier opposite: #javaForEachStatementFieldNameOwner',
		'#type => FMOne type: #FASTJavaTypeExpression opposite: #javaForEachStatementTypeOwner'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaForEachStatement class >> annotation [

	<FMClass: #ForEachStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaForEachStatement >> body [
	"Relation named: #body type: #FASTTStatement opposite: #javaForEachStatementOwner"

	<generated>
	<FMComment: 'The body of the for-each statement'>
	<FMProperty: #body type: #FASTTStatement opposite: #javaForEachStatementOwner>
	^ self attributeAt: #body ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForEachStatement >> body: anObject [

	<generated>
	(self attributeAt: #body ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self body.
		self attributeAt: #body put: anObject.
		otherSide javaForEachStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #body put: anObject.
		anObject javaForEachStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaForEachStatement >> bodyGroup [
	<generated>
	<navigation: 'Body'>
	^ MooseSpecializedGroup with: self body
]

{ #category : #accessing }
FASTJavaForEachStatement >> fieldname [
	"Relation named: #fieldname type: #FASTJavaIdentifier opposite: #javaForEachStatementFieldNameOwner"

	<generated>
	<FMComment: 'The identifier of the created local variable'>
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
	^ MooseSpecializedGroup with: self fieldname
]

{ #category : #accessing }
FASTJavaForEachStatement >> list [
	"Relation named: #list type: #FASTTExpression opposite: #javaForEachStatementOwner"

	<generated>
	<FMComment: 'The list that the for-each statement iterates over'>
	<FMProperty: #list type: #FASTTExpression opposite: #javaForEachStatementOwner>
	^ self attributeAt: #list ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForEachStatement >> list: anObject [

	<generated>
	(self attributeAt: #list ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self list.
		self attributeAt: #list put: anObject.
		otherSide javaForEachStatementOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #list put: anObject.
		anObject javaForEachStatementOwner: self ]
]

{ #category : #navigation }
FASTJavaForEachStatement >> listGroup [
	<generated>
	<navigation: 'List'>
	^ MooseSpecializedGroup with: self list
]

{ #category : #accessing }
FASTJavaForEachStatement >> type [
	"Relation named: #type type: #FASTJavaTypeExpression opposite: #javaForEachStatementTypeOwner"

	<generated>
	<FMComment: 'The type of the created local variable'>
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
	^ MooseSpecializedGroup with: self type
]
