"
I check that an element-value pair of an annotation is an entity of its own (JLS 9.7.1). It names an element and gives it a value, which may be an annotation or an array of element values, neither of which is an expression; read as an assignment, `@Outer(inner = @Inner)` made the import fail.
"
Class {
	#name : 'JavaSmaCCElementValuePairTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCElementValuePairTest >> javaClass [

	^ '@Outer(inner = @Inner(title = "x"), items = { @Item(name = "a"), @Item(name = "b") })
@SuppressWarnings("unchecked")
class A {
}'
]

{ #category : 'accessing' }
JavaSmaCCElementValuePairTest >> pairs [

	^ (fastModel allWithType: FASTJavaElementValuePair) sorted: [ :a :b | a startPos < b startPos ]
]

{ #category : 'tests' }
JavaSmaCCElementValuePairTest >> testAPairNamesTheElementItGivesAValue [

	self assert: (self pairs collect: [ :pair | pair name ]) asArray equals: #( 'inner' 'title' 'items' 'name' 'name' )
]

{ #category : 'tests' }
JavaSmaCCElementValuePairTest >> testASingleElementAnnotationGivesItsValueAlone [

	| suppress |
	suppress := (fastModel allWithType: FASTJavaAnnotation) detect: [ :annotation | annotation type name = 'SuppressWarnings' ].
	self assert: suppress elements size equals: 1.
	self assert: suppress elements anyOne class equals: FASTJavaStringLiteral
]

{ #category : 'tests' }
JavaSmaCCElementValuePairTest >> testAnAnnotationMayBeTheValueOfAPair [

	| inner |
	inner := self pairs first.
	self assert: inner value class equals: FASTJavaAnnotation.
	self assert: inner value type name equals: 'Inner'.
	self assert: inner value elementValuePairOwner equals: inner.
	self assert: inner parentAnnotation type name equals: 'Outer'
]

{ #category : 'tests' }
JavaSmaCCElementValuePairTest >> testAnArrayOfAnnotationsMayBeTheValueOfAPair [

	| items |
	items := self pairs third value.
	self assert: items class equals: FASTJavaArrayAnnotationElement.
	self assert: (items values collect: [ :item | item type name ]) asArray equals: #( 'Item' 'Item' )
]

{ #category : 'tests' }
JavaSmaCCElementValuePairTest >> testEveryPairIsExportedAsWritten [

	| exported |
	exported := FASTJavaExportVisitor new export: (fastModel allWithType: FASTJavaCompilationUnit) anyOne.
	self assert: (exported includesSubstring: 'inner = @Inner(title = "x")').
	self assert: (exported includesSubstring: 'items = { @Item(name = "a"), @Item(name = "b") }')
]
