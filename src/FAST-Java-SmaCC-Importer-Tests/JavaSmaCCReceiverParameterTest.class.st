Class {
	#name : 'JavaSmaCCReceiverParameterTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCReceiverParameterTest >> javaClass [

	^ 'class Outer {

	void plain(Outer this, int a) { }

	class Inner {
		Inner(@Deprecated Outer Outer.this) { }
	}
}'
]

{ #category : 'tests' }
JavaSmaCCReceiverParameterTest >> testMethodWithoutAReceiverHasNone [

	| model |
	model := self parseClassString: 'class Outer { void m(int a) { } }'.

	self assert: (model allWithType: FASTJavaReceiverParameter) isEmpty.
	self assert: (model allWithType: FASTJavaMethodEntity) anyOne receiver isNil
]

{ #category : 'tests' }
JavaSmaCCReceiverParameterTest >> testQualifiedReceiverKeepsItsAnnotationsAndName [
	"JLS 8.4.1: a constructor of an inner class qualifies `this` with the name of the type
	it is nested in, and the receiver carries the annotations written on its type."

	| receiver |
	receiver := (fastModel allWithType: FASTJavaReceiverParameter)
		            detect: [ :each | each qualifier isNotNil ].

	self assert: receiver qualifier equals: 'Outer'.
	self assert: receiver type typeName name equals: 'Outer'.
	self assert: (receiver modifiers collect: [ :modifier | modifier name ]) asArray
		equals: #( 'Deprecated' )
]

{ #category : 'tests' }
JavaSmaCCReceiverParameterTest >> testReceiverIsHeldApartFromTheParameters [
	"JLS 8.4.1: a receiver parameter declares nothing, so the method holds it apart from
	the parameters it declares."

	| method |
	method := (fastModel allWithType: FASTJavaMethodEntity) detect: [ :each | each name = 'plain' ].

	self assert: method receiver isNotNil.
	self assert: method receiver type typeName name equals: 'Outer'.
	self assert: method receiver qualifier isNil.
	self assert: method parameters size equals: 1.
	self assert: method parameters anyOne variable name equals: 'a'
]
