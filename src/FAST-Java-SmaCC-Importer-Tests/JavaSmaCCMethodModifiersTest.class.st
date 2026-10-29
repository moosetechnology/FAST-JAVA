Class {
	#name : 'JavaSmaCCMethodModifiersTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodModifiersTest >> javaMethod [
	^ '
	@Hello
	private transient void hello(){}'
]

{ #category : 'tests' }
JavaSmaCCMethodModifiersTest >> testMethodModifiersAnnotationNumber [
	self
		assert: ((fastModel allWithType: FASTJavaMethodEntity) anyOne modifiers count: [ :mod | mod class = FASTJavaAnnotation ])
		equals: 1
]

{ #category : 'tests' }
JavaSmaCCMethodModifiersTest >> testMethodModifiersKeepTheOrderTheyAreWritten [
	"JLS 8.4.3: a method writes annotations and keywords in any order, and the model keeps
	the run as the source writes it."

	| interleaved modifiers |
	interleaved := self parseMethodString: '@A public final @B void hello(){}'.
	modifiers := (interleaved allWithType: FASTJavaMethodEntity) anyOne modifiers.

	self
		assert: (modifiers collect: [ :modifier |
				  modifier isAnnotation
					  ifTrue: [ modifier name ]
					  ifFalse: [ modifier token ] ]) asArray
		equals: #( 'A' 'public' 'final' 'B' )
]

{ #category : 'tests' }
JavaSmaCCMethodModifiersTest >> testMethodModifiersNumber [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne modifiers size equals: 3
]
