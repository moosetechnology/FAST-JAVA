Class {
	#name : 'JavaSmaCCBracketAnnotationsTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCBracketAnnotationsTest >> annotationsOf: aDimensionCollection [

	^ (aDimensionCollection collect: [ :dimension |
		   (dimension annotations collect: [ :modifier | modifier name ]) asArray ]) asArray
]

{ #category : 'resources' }
JavaSmaCCBracketAnnotationsTest >> javaClass [

	^ 'class Brackets {

	int field @A [] @B [], plain;

	String @A [] @B [] typed;

	void varargs(Object @A ... args) { }

	int values() @A [] { return null; }

	void params(int p @A [], long q) { }
}'
]

{ #category : 'tests' }
JavaSmaCCBracketAnnotationsTest >> testBracketsAfterAParameterListAndAfterAParameterKeepTheirAnnotations [
	"JLS 8.4 and 10.2: a method writes the brackets of the array it returns after its
	parameter list, and a parameter writes its own after its name."

	| method parameter |
	method := (fastModel allWithType: FASTJavaMethodEntity) detect: [ :each | each name = 'values' ].
	parameter := (fastModel allWithType: FASTJavaParameter) detect: [ :each | each variable name = 'p' ].

	self assert: (self annotationsOf: method brackets) equals: #( #( 'A' ) ).
	self assert: (self annotationsOf: parameter brackets) equals: #( #( 'A' ) )
]

{ #category : 'tests' }
JavaSmaCCBracketAnnotationsTest >> testDimensionsStillAnswersHowManyPairsAreWritten [
	"A dimension is an entity now, because each pair carries its own annotations. What a
	reader asked for before is how many pairs there are, which `dimensions` still answers.
	There is no `dimensions:` to go with it: saying how many pairs there are would mean
	creating entities, and only a model can do that."

	| declarator method parameter |
	declarator := (fastModel allWithType: FASTJavaVariableDeclarator)
		              detect: [ :each | each variable name = 'field' ].
	method := (fastModel allWithType: FASTJavaMethodEntity)
		          detect: [ :each | each name = 'values' ].
	parameter := (fastModel allWithType: FASTJavaParameter)
		             detect: [ :each | each variable name = 'q' ].
	self assert: declarator dimensions equals: 2.
	self assert: method dimensions equals: 1.
	self assert: parameter dimensions equals: 0
]

{ #category : 'tests' }
JavaSmaCCBracketAnnotationsTest >> testEachPairOfBracketsAfterANameKeepsItsOwnAnnotations [
	"JLS 10.2: `int field @A [] @B []` writes one annotation on each pair, and a declarator
	beside it that writes no bracket keeps none."

	| declarators |
	declarators := (fastModel allWithType: FASTJavaVariableDeclarator)
		               sorted: [ :a :b | a startPos < b startPos ].

	self assert: (declarators collect: [ :each | each variable name ]) asArray
		equals: #( 'field' 'plain' 'typed' ).
	self assert: (self annotationsOf: declarators first brackets)
		equals: #( #( 'A' ) #( 'B' ) ).
	self assert: declarators second brackets isEmpty.
	self assert: declarators third brackets isEmpty
]

{ #category : 'tests' }
JavaSmaCCBracketAnnotationsTest >> testEachPairOfBracketsOfATypeKeepsItsOwnAnnotations [
	"JLS 10.2: `String @A [] @B []` annotates each pair, and the model nests one array
	type per pair, the innermost holding the one written first."

	| outer |
	outer := (fastModel allWithType: FASTJavaArrayTypeExpression)
		         detect: [ :each | each baseType isArrayTypeExpression ].

	self assert: (outer annotations collect: [ :modifier | modifier name ]) asArray
		equals: #( 'B' ).
	self assert: (outer baseType annotations collect: [ :modifier | modifier name ]) asArray
		equals: #( 'A' ).
	self assert: outer baseType baseType name equals: 'String'
]

{ #category : 'tests' }
JavaSmaCCBracketAnnotationsTest >> testTheEllipsisOfAVariableArityParameterKeepsItsAnnotations [
	"JLS 8.4.1: the annotations written before `...` are written on the array type the
	ellipsis makes, which is the dimension it adds."

	| parameter |
	parameter := (fastModel allWithType: FASTJavaParameter) detect: [ :each | each hasVariableArguments ].

	self assert: parameter variableArguments isNotNil.
	self assert: (parameter variableArguments annotations collect: [ :modifier | modifier name ]) asArray equals: #( 'A' ).
	self assert: parameter modifiers isEmpty.
	self assert: parameter brackets isEmpty
]
