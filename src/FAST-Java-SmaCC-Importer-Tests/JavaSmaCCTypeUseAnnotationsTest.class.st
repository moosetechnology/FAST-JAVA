Class {
	#name : 'JavaSmaCCTypeUseAnnotationsTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCTypeUseAnnotationsTest >> javaClass [

	^ 'class TypeUse<T extends @Ann Object & @Ann Cloneable> {

	java.util.List<@Ann String> argument;

	java.util.List<@Ann ?> wildcard;

	java.util.List<? extends @Ann Number> bounded;

	java.util.function.Supplier<String> reference = @Ann TypeUse::label;

	static String label() { return "x"; }
}'
]

{ #category : 'tests' }
JavaSmaCCTypeUseAnnotationsTest >> testATypeArgumentKeepsItsAnnotations [
	"JLS 4.11: an annotation written before a type argument is written on that type, and
	not on the type that takes the argument."

	| argument |
	argument := self typeArgumentOf: 'argument'.

	self assert: argument class equals: FASTJavaClassTypeExpression.
	self assert: argument typeName name equals: 'String'.
	self assert: (argument modifiers collect: [ :modifier | modifier name ]) asArray equals: #( 'Ann' )
]

{ #category : 'tests' }
JavaSmaCCTypeUseAnnotationsTest >> testAWildcardKeepsItsOwnAnnotationsApartFromItsBoundOnes [
	"JLS 4.5.1: `List<@Ann ?>` annotates the wildcard, where `List<? extends @Ann Number>`
	annotates the bound and leaves the wildcard bare."

	| wildcard bounded |
	wildcard := self typeArgumentOf: 'wildcard'.
	bounded := self typeArgumentOf: 'bounded'.

	self assert: wildcard name equals: '?'.
	self assert: (wildcard modifiers collect: [ :modifier | modifier name ]) asArray equals: #( 'Ann' ).
	self assert: wildcard types isEmpty.

	self assert: bounded name equals: '?'.
	self assert: bounded modifiers isEmpty.
	self assert: (bounded types anyOne modifiers collect: [ :modifier | modifier name ]) asArray equals: #( 'Ann' )
]

{ #category : 'tests' }
JavaSmaCCTypeUseAnnotationsTest >> testEveryBoundOfATypeParameterKeepsItsAnnotations [
	"JLS 4.4: each bound of a type parameter writes its own annotations, the first as much
	as the ones after an ampersand."

	| parameter |
	parameter := (fastModel allWithType: FASTJavaTypeParameterExpression) detect: [ :each | each name = 'T' ].

	self assert: parameter modifiers isEmpty.
	self assert: (parameter types collect: [ :bound | bound typeName name ]) asArray equals: #( 'Object' 'Cloneable' ).
	parameter types do: [ :bound | self assert: (bound modifiers collect: [ :modifier | modifier name ]) asArray equals: #( 'Ann' ) ]
]

{ #category : 'tests' }
JavaSmaCCTypeUseAnnotationsTest >> testTheTypeAMethodReferenceNamesKeepsItsAnnotations [
	"JLS 15.13: a receiver written with annotations is a type, which carries them."

	| reference |
	reference := (fastModel allWithType: FASTJavaMethodReference) anyOne.

	self assert: reference receiver class equals: FASTJavaClassTypeExpression.
	self assert: reference receiver typeName name equals: 'TypeUse'.
	self assert: (reference receiver modifiers collect: [ :modifier | modifier name ]) asArray equals: #( 'Ann' )
]

{ #category : 'accessing' }
JavaSmaCCTypeUseAnnotationsTest >> typeArgumentOf: aFieldName [

	^ ((fastModel allWithType: FASTJavaVarDeclStatement) detect: [ :each | each declarators anyOne variable name = aFieldName ]) type
		  arguments anyOne
]
