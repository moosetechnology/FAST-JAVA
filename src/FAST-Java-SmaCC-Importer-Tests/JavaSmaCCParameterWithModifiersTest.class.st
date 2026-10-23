"
I check that a parameter keeps the modifiers it is declared with, an annotation (JLS 9.7.4) and `final` among them.
"
Class {
	#name : 'JavaSmaCCParameterWithModifiersTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCParameterWithModifiersTest >> javaMethod [

	^ 'void hello(@Deprecated final String text, int plain) {}'
]

{ #category : 'accessing' }
JavaSmaCCParameterWithModifiersTest >> parameters [

	^ fastMethod parameters
]

{ #category : 'tests' }
JavaSmaCCParameterWithModifiersTest >> testParameterKeepsTheAnnotationItWrites [

	self assert: (self parameters first modifiers detect: [ :each | each isAnnotation ]) name equals: 'Deprecated'
]

{ #category : 'tests' }
JavaSmaCCParameterWithModifiersTest >> testParameterKeepsTheModifierItWrites [

	self assert: (self parameters first modifiers detect: [ :each | each isAnnotation not ]) token equals: 'final'
]

{ #category : 'tests' }
JavaSmaCCParameterWithModifiersTest >> testParameterKeepsTheModifiersInTheOrderItWritesThem [

	self assert: (self parameters first modifiers collect: [ :each | each class ]) asArray
		equals: { FASTJavaAnnotation. FASTJavaModifier }
]

{ #category : 'tests' }
JavaSmaCCParameterWithModifiersTest >> testParameterWithoutModifiersHasNone [

	self assertEmpty: self parameters second modifiers
]
