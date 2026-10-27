Class {
	#name : 'JavaSmaCCIntersectionCastTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCIntersectionCastTest >> castTo: aTypeName [

	^ (fastModel allWithType: FASTJavaCastExpression) detect: [ :each | each type fullName = aTypeName ]
]

{ #category : 'resources' }
JavaSmaCCIntersectionCastTest >> javaMethod [
	^ 'void newMethod() {
	Object sorter = (Comparator<String> & Serializable) (a, b) -> 0;
	Object plain = (String) raw;
	Runnable task = (Runnable & Serializable & Cloneable) job;
}'
]

{ #category : 'tests' }
JavaSmaCCIntersectionCastTest >> testCastWritingAnAdditionalBoundKeepsIt [
	"JLS 4.9: the interface types a cast writes after the first are the additional bounds
	of the intersection type it casts to. Here the bound is why the cast is written: it is
	what makes the lambda serializable."

	| cast |
	cast := self castTo: 'Comparator'.
	self assert: (cast additionalBounds asOrderedCollection collect: [ :each | each fullName ]) asArray
		equals: #( 'Serializable' )
]

{ #category : 'tests' }
JavaSmaCCIntersectionCastTest >> testCastWritingNoAdditionalBoundHasNone [
	"JLS 4.9: a cast to one reference type writes no bound after it, and there is nothing
	for the model to keep."

	self assert: (self castTo: 'String') additionalBounds isEmpty
]

{ #category : 'tests' }
JavaSmaCCIntersectionCastTest >> testCastWritingSeveralAdditionalBoundsKeepsThemAllInOrder [
	"JLS 4.9: an intersection type cast writes as many interface types after the first as
	it needs, and each one is a bound of the type cast to, so none of them may be lost and
	the order they are written in is kept."

	| cast |
	cast := self castTo: 'Runnable'.
	self
		assert: (cast additionalBounds asOrderedCollection collect: [ :each | each fullName ]) asArray
		equals: #( 'Serializable' 'Cloneable' )
]
