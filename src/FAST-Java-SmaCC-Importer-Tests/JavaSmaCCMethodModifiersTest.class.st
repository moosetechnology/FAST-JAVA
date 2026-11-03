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

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne annotations size equals: 1
]

{ #category : 'tests' }
JavaSmaCCMethodModifiersTest >> testMethodModifiersKeepTheOrderTheyAreWritten [
	"JLS 8.4.3: a method writes annotations and keywords in any order. The model holds them
	apart, and the positions they carry give back the run the source writes."

	| interleaved written |
	interleaved := self parseMethodString: '@A public final @B void hello(){}'.
	written := self writtenModifiersOf: (interleaved allWithType: FASTJavaMethodEntity) anyOne.
	self
		assert: (written collect: [ :modifier |
					 modifier isAnnotation
						 ifTrue: [ modifier name ]
						 ifFalse: [ modifier token ] ])
		equals: #( 'A' 'public' 'final' 'B' )
]

{ #category : 'tests' }
JavaSmaCCMethodModifiersTest >> testMethodModifiersNumber [

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne modifiers size equals: 2
]
