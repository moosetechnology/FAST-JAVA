"
I check that the type parameters of generic declarations are imported: classes, interfaces, methods and constructors (JLS 4.4).
"
Class {
	#name : 'JavaSmaCCTypeParametersTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'helpers' }
JavaSmaCCTypeParametersTest >> boxClass [

	^ (fastModel allWithType: FASTJavaClassDeclaration) anyOne
]

{ #category : 'accessing' }
JavaSmaCCTypeParametersTest >> javaClass [

	^ 'public class Box<T extends Number, U> {
	<R extends Error> Box(R seed) throws Error { }
	<R> R pick(T item) throws Error { return null; }
}

interface Picker<T> {
	<R extends Number> R pick(T item) throws Error;
}'
]

{ #category : 'helpers' }
JavaSmaCCTypeParametersTest >> methodNamed: aName in: aDeclaration [

	^ aDeclaration declarations detect: [ :declaration | declaration isMethodEntity and: [ declaration name = aName ] ]
]

{ #category : 'tests' }
JavaSmaCCTypeParametersTest >> testClassTypeParameterBound [

	| parameter |
	parameter := self boxClass typeParameters first.
	self assert: parameter types size equals: 1.
	self assert: parameter types first typeName fullName equals: 'Number'
]

{ #category : 'tests' }
JavaSmaCCTypeParametersTest >> testClassTypeParameters [

	self
		assertCollection: (self boxClass typeParameters collect: [ :parameter | parameter name ])
		equals: #( 'T' 'U' ) asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCTypeParametersTest >> testConstructorThrows [

	| constructor |
	constructor := self methodNamed: 'Box' in: self boxClass.
	self
		assertCollection: (constructor throws collect: [ :throw | throw typeName fullName ])
		equals: #( 'Error' ) asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCTypeParametersTest >> testConstructorTypeParameters [

	| constructor |
	constructor := self methodNamed: 'Box' in: self boxClass.
	self assertCollection: (constructor typeParameters collect: [ :parameter | parameter name ]) equals: #( 'R' ) asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCTypeParametersTest >> testInterfaceMethodThrows [

	| interface method |
	interface := (fastModel allWithType: FASTJavaInterfaceDeclaration) anyOne.
	method := self methodNamed: 'pick' in: interface.
	self assertCollection: (method throws collect: [ :throw | throw typeName fullName ]) equals: #( 'Error' ) asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCTypeParametersTest >> testInterfaceMethodTypeParameters [

	| interface method |
	interface := (fastModel allWithType: FASTJavaInterfaceDeclaration) anyOne.
	method := self methodNamed: 'pick' in: interface.
	self assertCollection: (method typeParameters collect: [ :parameter | parameter name ]) equals: #( 'R' ) asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCTypeParametersTest >> testInterfaceTypeParameters [

	| interface |
	interface := (fastModel allWithType: FASTJavaInterfaceDeclaration) anyOne.
	self assertCollection: (interface typeParameters collect: [ :parameter | parameter name ]) equals: #( 'T' ) asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCTypeParametersTest >> testMethodTypeParameters [

	| method |
	method := self methodNamed: 'pick' in: self boxClass.
	self assertCollection: (method typeParameters collect: [ :parameter | parameter name ]) equals: #( 'R' ) asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCTypeParametersTest >> testTypeParameterOwnerIsTheDeclaration [

	self boxClass typeParameters do: [ :parameter | self assert: parameter javaTypeParameterOwner identicalTo: self boxClass ]
]
