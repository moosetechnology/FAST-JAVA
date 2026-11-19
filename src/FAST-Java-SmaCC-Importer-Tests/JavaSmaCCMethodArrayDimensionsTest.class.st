Class {
	#name : 'JavaSmaCCMethodArrayDimensionsTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCMethodArrayDimensionsTest >> javaClass [

	^ 'class Dimensions {

	int[] values() [] { return null; }

	int plain() { return 0; }

	long deep() [][] { return null; }
}'
]

{ #category : 'tests' }
JavaSmaCCMethodArrayDimensionsTest >> testAMethodKeepsTheBracketsWrittenAfterItsParameterList [
	"JLS 8.4: `int[] values() []` returns an `int[][]`, and the JLS keeps the form only
	for compatibility. The brackets stay where they are written, so the type a method
	returns is the one it writes before its name with these dimensions added."

	| methods |
	methods := (fastModel allWithType: FASTJavaMethodEntity) sorted: [ :a :b | a startPos < b startPos ].

	self assert: (methods collect: [ :each | each name ]) asArray equals: #( 'values' 'plain' 'deep' ).
	self assert: (methods collect: [ :each | each dimensions ]) asArray equals: #( 1 0 2 ).
	self assert: methods first type class equals: FASTJavaArrayTypeExpression.
	self assert: methods last type class equals: FASTJavaLongTypeExpression
]

{ #category : 'tests' }
JavaSmaCCMethodArrayDimensionsTest >> testAMethodWithoutABodyKeepsTheBracketsWrittenAfterItsParameterList [
	"JLS 9.4: an interface method without a body writes its declarator as any method does,
	brackets after its parameter list included."

	| method |
	method := (self parseClassString: 'interface I { int values() @A [] []; }')
		          allWithType: FASTJavaMethodEntity.
	method := method anyOne.

	self assert: method name equals: 'values'.
	self assert: method dimensions equals: 2.
	self assert: (method brackets first annotations collect: [ :annotation | annotation type name ]) asArray
		equals: #( 'A' )
]

{ #category : 'tests' }
JavaSmaCCMethodArrayDimensionsTest >> testAnAnnotationElementKeepsTheBracketsWrittenAfterItsParameterList [
	"JLS 9.6.1: an element of an annotation interface is declared as a method, so it may
	write the brackets of the array it returns after its empty parameter list."

	| element |
	element := (self parseClassString: '@interface A { int values() []; }')
		           allWithType: FASTJavaAnnotationElementDeclaration.
	element := element anyOne.

	self assert: element name equals: 'values'.
	self assert: element brackets size equals: 1
]
