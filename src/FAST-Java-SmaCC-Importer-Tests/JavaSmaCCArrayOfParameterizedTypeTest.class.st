Class {
	#name : 'JavaSmaCCArrayOfParameterizedTypeTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCArrayOfParameterizedTypeTest >> arrayTypes [

	^ (fastModel allWithType: FASTJavaArrayTypeExpression) asOrderedCollection
]

{ #category : 'resources' }
JavaSmaCCArrayOfParameterizedTypeTest >> componentNamed: aName [

	^ self parameterizedComponents detect: [ :component | component typeName name = aName ]
]

{ #category : 'resources' }
JavaSmaCCArrayOfParameterizedTypeTest >> javaClass [

	^ 'class Probe {
	Class<?>[] types;
	String[] names;
	Map<String, Integer>[][] grids;

	List<String>[] copy(List<String>[] lists) {
		return lists;
	}
}'
]

{ #category : 'resources' }
JavaSmaCCArrayOfParameterizedTypeTest >> parameterizedComponents [

	^ (self arrayTypes collect: [ :array | array baseType ]) select: [ :component |
		  component isClassTypeExpression ]
]

{ #category : 'tests' }
JavaSmaCCArrayOfParameterizedTypeTest >> testArgumentsAreKeptWhereverAnArrayTypeIsWritten [
	"JLS 8.3, 8.4: the type of a field, the result of a method and the type of a parameter
	are written the same way, so a component is read the same in each of them."

	self
		assert: (self parameterizedComponents collect: [ :component | component typeName name ] as: Array) sort
		equals: #( 'Class' 'List' 'List' 'Map' )
]

{ #category : 'tests' }
JavaSmaCCArrayOfParameterizedTypeTest >> testComponentOfANestedArrayKeepsItsArguments [
	"JLS 10.1: `Map<String, Integer>[][]` is an array of arrays, and the parameterized
	type is the component of the inner one."

	| outer |
	outer := self arrayTypes detect: [ :array | array baseType isArrayTypeExpression ].
	self assert: outer baseType baseType typeName name equals: 'Map'.
	self assert: outer baseType baseType arguments size equals: 2
]

{ #category : 'tests' }
JavaSmaCCArrayOfParameterizedTypeTest >> testComponentWritingArgumentsIsAParameterizedType [
	"JLS 10.1: the component type of `Class<?>[]` is the parameterized type `Class<?>`,
	wildcard and all."

	self assert: (self componentNamed: 'Class') class equals: FASTJavaClassTypeExpression.
	self assert: (self componentNamed: 'Class') arguments size equals: 1.
	self assert: (self componentNamed: 'Class') arguments anyOne name equals: '?'
]

{ #category : 'tests' }
JavaSmaCCArrayOfParameterizedTypeTest >> testComponentWritingNoArgumentsStaysABareName [
	"JLS 10.1: `String[]` writes no arguments for its component, so there are none to keep
	and the component stays the name it is written as."

	self deny: (self parameterizedComponents anySatisfy: [ :component | component typeName name = 'String' ]).
	self assert: (self arrayTypes anySatisfy: [ :array |
		 array baseType class = FASTJavaTypeName and: [ array baseType name = 'String' ] ])
]
