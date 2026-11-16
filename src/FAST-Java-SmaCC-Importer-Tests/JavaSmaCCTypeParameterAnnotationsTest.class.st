Class {
	#name : 'JavaSmaCCTypeParameterAnnotationsTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCTypeParameterAnnotationsTest >> javaClass [

	^ 'class Holder<@Deprecated T extends Number> { }'
]

{ #category : 'tests' }
JavaSmaCCTypeParameterAnnotationsTest >> testTypeParameterKeepsItsAnnotations [
	"JLS 4.4: a type parameter writes annotations of its own before its name."

	| parameter |
	parameter := (fastModel allWithType: FASTJavaTypeParameterExpression) anyOne.

	self assert: parameter name equals: 'T'.
	self assert: (parameter annotations collect: [ :annotation | annotation name ]) asArray
		equals: #( 'Deprecated' ).
	self assert: parameter types anyOne typeName name equals: 'Number'
]

{ #category : 'tests' }
JavaSmaCCTypeParameterAnnotationsTest >> testTypeParameterWithoutAnnotationsHasNone [

	| model |
	model := self parseClassString: 'class Holder<T> { }'.

	self assert: (model allWithType: FASTJavaTypeParameterExpression) anyOne annotations isEmpty
]
