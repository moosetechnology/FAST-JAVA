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
JavaSmaCCNewArrayBracketsTest >> testEachPairOfBracketsHoldsTheArgumentOfTheSameIndex [
	"JLS 15.10.1: an array creation writes a pair of brackets for each dimension, and the
	expressions sizing the first ones inside them."

	self newArrays do: [ :array |
		self assert: array brackets size equals: array arguments size.
		array brackets with: array arguments do: [ :bracket :argument |
			self assert: bracket startPos <= argument startPos.
			self assert: bracket endPos >= argument endPos ] ]
]

{ #category : 'tests' }
JavaSmaCCNewArrayBracketsTest >> testEachPairOfBracketsKeepsTheAnnotationsWrittenBeforeIt [

	self
		assert: (self newArrays collect: [ :array |
				 array brackets asArray collect: [ :bracket |
					 (bracket annotations collect: [ :annotation | annotation name ]) asArray ] ]) asArray
		equals: #( #( #( 'A' ) #( 'B' ) #(  ) ) #( #( 'C' ) ) )
]
