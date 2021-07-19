"
I represent a java array access
	
ex:

liste[i]
"
Class {
	#name : #FASTJavaArrayAccess,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAssigneable + FASTJavaTReceiver + FASTTExpression',
	#classTraits : 'FASTJavaTAssigneable classTrait + FASTJavaTReceiver classTrait + FASTTExpression classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaArrayAccess class >> annotation [

	<FMClass: #ArrayAccess super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaArrayAccess >> array [
	"Relation named: #array type: #FASTTExpression opposite: #javaArrayArrayAccessOwner"

	<generated>
	<FMComment: 'Name of accessed field'>
	<FMProperty: #array type: #FASTTExpression opposite: #javaArrayArrayAccessOwner>
	^ self attributeAt: #array ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaArrayAccess >> array: anObject [

	<generated>
	(self attributeAt: #array ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self array.
		self attributeAt: #array put: anObject.
		otherSide javaArrayArrayAccessOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #array put: anObject.
		anObject javaArrayArrayAccessOwner: self ]
]

{ #category : #navigation }
FASTJavaArrayAccess >> arrayGroup [
	<generated>
	<navigation: 'Array'>
	^ MooseSpecializedGroup with: self array
]

{ #category : #accessing }
FASTJavaArrayAccess >> expression [
	"Relation named: #expression type: #FASTTExpression opposite: #javaArrayAccessOwner"

	<generated>
	<FMComment: 'The accessed index'>
	<FMProperty: #expression type: #FASTTExpression opposite: #javaArrayAccessOwner>
	^ self attributeAt: #expression ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaArrayAccess >> expression: anObject [

	<generated>
	(self attributeAt: #expression ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self expression.
		self attributeAt: #expression put: anObject.
		otherSide javaArrayAccessOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #expression put: anObject.
		anObject javaArrayAccessOwner: self ]
]

{ #category : #navigation }
FASTJavaArrayAccess >> expressionGroup [
	<generated>
	<navigation: 'Expression'>
	^ MooseSpecializedGroup with: self expression
]
