"
I represent the array initializer and I have many initializers
	
ex:
String patate = {""hello"", ""world""}


I am : {""hello"", ""world""} 
My initializers are 
""hello"" and ""world""
 
"
Class {
	#name : #FASTJavaArrayInitializer,
	#superclass : #FASTExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaArrayInitializer class >> annotation [

	<FMClass: #ArrayInitializer super: #FASTExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaArrayInitializer >> addInitializer: anObject [
	<generated>
	^ self initializers add: anObject
]

{ #category : #accessing }
FASTJavaArrayInitializer >> initializers [
	"Relation named: #initializers type: #FASTExpression opposite: #javaArrayInitializers"

	<generated>
	<FMComment: 'My initializers'>
	<derived>
	<FMProperty: #initializers type: #FASTExpression opposite: #javaArrayInitializers>
	^ self privateState attributeAt: #initializers ifAbsentPut: [ FMMultivalueLink on: self opposite: #javaArrayInitializers: ]
]

{ #category : #accessing }
FASTJavaArrayInitializer >> initializers: anObject [

	<generated>
	self initializers value: anObject
]

{ #category : #navigation }
FASTJavaArrayInitializer >> initializersGroup [
	<generated>
	<navigation: 'Initializers'>
	^ MooseGroup withAll: self initializers asSet
]
