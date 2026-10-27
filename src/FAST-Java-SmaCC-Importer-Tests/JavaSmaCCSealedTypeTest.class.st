Class {
	#name : 'JavaSmaCCSealedTypeTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCSealedTypeTest >> classNamed: aName [

	^ (fastModel allWithType: FASTJavaClassDeclaration) detect: [ :each | each name = aName ]
]

{ #category : 'resources' }
JavaSmaCCSealedTypeTest >> interfaceNamed: aName [

	^ (fastModel allWithType: FASTJavaInterfaceDeclaration) detect: [ :each | each name = aName ]
]

{ #category : 'resources' }
JavaSmaCCSealedTypeTest >> javaClass [

	^ 'sealed interface Shape permits Circle, Square {
}

sealed class Circle implements Shape permits SmallCircle {
}

class Square implements Shape {
}'
]

{ #category : 'resources' }
JavaSmaCCSealedTypeTest >> namesPermittedBy: aDeclaration [

	^ (aDeclaration permittedSubtypes asOrderedCollection collect: [ :each | each fullName ]) asArray
]

{ #category : 'tests' }
JavaSmaCCSealedTypeTest >> testPermittedSubtypesAreNotTheInterfacesImplemented [
	"JLS 8.1.5 and 8.1.6: what a class implements and what it permits to extend it are two
	clauses pointing opposite ways, and the model keeps them apart."

	| circle |
	circle := self classNamed: 'Circle'.
	self
		assert: (circle interfaces asOrderedCollection collect: [ :each | each fullName ]) asArray
		equals: #( 'Shape' ).
	self assert: (self namesPermittedBy: circle) equals: #( 'SmallCircle' )
]

{ #category : 'tests' }
JavaSmaCCSealedTypeTest >> testSealedClassKeepsTheTypesItPermits [
	"JLS 8.1.6: a sealed class names the classes permitted to extend it directly, and a
	class it does not name cannot, whatever that class declares."

	self assert: (self namesPermittedBy: (self classNamed: 'Circle')) equals: #( 'SmallCircle' )
]

{ #category : 'tests' }
JavaSmaCCSealedTypeTest >> testSealedInterfaceKeepsTheTypesItPermits [
	"JLS 9.1.4: a sealed interface names the classes and interfaces permitted to extend or
	implement it directly, in the order it writes them."

	self assert: (self namesPermittedBy: (self interfaceNamed: 'Shape')) equals: #( 'Circle' 'Square' )
]

{ #category : 'tests' }
JavaSmaCCSealedTypeTest >> testTypePermittingNothingHasNoPermittedSubtypes [
	"JLS 8.1.6: the clause is written only by a sealed class, and a class without it
	permits nothing by name."

	self assert: (self namesPermittedBy: (self classNamed: 'Square')) equals: #(  )
]
