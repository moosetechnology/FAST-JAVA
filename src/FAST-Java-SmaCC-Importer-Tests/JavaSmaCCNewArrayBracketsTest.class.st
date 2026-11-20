"
I check that an array creation keeps the annotations written before each pair of brackets it writes (JLS 15.10.1).
"
Class {
	#name : 'JavaSmaCCNewArrayBracketsTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCNewArrayBracketsTest >> javaMethod [

	^ 'void create() {
	Object sized = new int @A [1] @B [2] [];
	Object initialized = new int @C [] { 1 };
}'
]

{ #category : 'accessing' }
JavaSmaCCNewArrayBracketsTest >> newArrays [

	^ (fastModel allWithType: FASTJavaNewArray) sorted: [ :a :b | a startPos < b startPos ]
]

{ #category : 'tests' }
JavaSmaCCNewArrayBracketsTest >> testEachPairOfBracketsKeepsTheAnnotationsWrittenBeforeIt [

	self
		assert: (self newArrays collect: [ :array |
				 array brackets asArray collect: [ :bracket |
					 (bracket annotations collect: [ :annotation | annotation type name ]) asArray ] ]) asArray
		equals: #( #( #( 'A' ) #( 'B' ) #(  ) ) #( #( 'C' ) ) )
]

{ #category : 'tests' }
JavaSmaCCNewArrayBracketsTest >> testEachSizedPairOfBracketsHoldsItsExpression [
	"JLS 15.10.1: an array creation writes a pair of brackets for each dimension, and the
	expressions sizing the first ones inside them."

	| sized |
	self
		assert: (self newArrays collect: [ :array | (array brackets collect: [ :bracket | bracket class ]) asArray ]) asArray
		equals: { { FASTJavaDimensionExpression. FASTJavaDimensionExpression. FASTJavaDimension }. { FASTJavaDimension } }.
	sized := self newArrays first brackets asArray first: 2.
	sized do: [ :bracket |
		self assert: bracket startPos <= bracket expression startPos.
		self assert: bracket endPos >= bracket expression endPos ]
]
