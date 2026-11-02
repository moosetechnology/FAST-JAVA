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
