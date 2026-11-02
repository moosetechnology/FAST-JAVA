Class {
	#name : 'JavaSmaCCTypeAnnotationsTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCTypeAnnotationsTest >> javaClass [

	^ 'class Annotated extends @Deprecated Object {

	java.util.@Deprecated List<String> qualified;

	String @Deprecated [] array;

	void thrower() throws @Deprecated Exception { }

	Object cast() { return (@Deprecated Object) null; }
}'
]

{ #category : 'tests' }
JavaSmaCCTypeAnnotationsTest >> testAQualifiedTypeKeepsTheAnnotationsAfterTheDot [
	"JLS 4.3 and 4.11: a type qualified by a name writes its annotations after the dot, on
	the name they apply to."

	| qualified |
	qualified := (fastModel allWithType: FASTJavaQualifiedTypeName)
		             detect: [ :each | each name = 'List' ].

	self assert: (qualified modifiers collect: [ :modifier | modifier name ]) asArray
		equals: #( 'Deprecated' )
]

{ #category : 'tests' }
JavaSmaCCTypeAnnotationsTest >> testASuperclassAndAThrownTypeKeepTheirAnnotations [

	| declaration thrower |
	declaration := (fastModel allWithType: FASTJavaClassDeclaration) anyOne.
	thrower := (fastModel allWithType: FASTJavaMethodEntity) detect: [ :each | each name = 'thrower' ].

	self assert: (declaration superclass modifiers collect: [ :modifier | modifier name ]) asArray
		equals: #( 'Deprecated' ).
	self assert: (thrower throws anyOne modifiers collect: [ :modifier | modifier name ]) asArray
		equals: #( 'Deprecated' )
]

{ #category : 'tests' }
JavaSmaCCTypeAnnotationsTest >> testAnArrayTypeKeepsTheAnnotationsOfItsBrackets [
	"JLS 10.2: a pair of brackets writes its own annotations, which belong to the array and
	not to the component type."

	| array |
	array := (fastModel allWithType: FASTJavaArrayTypeExpression) anyOne.

	self assert: (array modifiers collect: [ :modifier | modifier name ]) asArray
		equals: #( 'Deprecated' ).
	self assert: array baseType modifiers isEmpty
]

{ #category : 'tests' }
JavaSmaCCTypeAnnotationsTest >> testTheAnnotationOfADeclarationStaysOnTheDeclaration [
	"JLS 9.7.4: where a declaration writes its modifiers, an annotation before the type is
	read as one of them. Both readings are in the JLS and only the annotation's target
	tells them apart, which a parser does not know."

	| model statement |
	model := self parseClassString: 'class Annotated { @Deprecated String name; }'.
	statement := (model allWithType: FASTJavaVarDeclStatement) anyOne.

	self assert: (statement modifiers collect: [ :modifier | modifier name ]) asArray
		equals: #( 'Deprecated' ).
	self assert: statement type modifiers isEmpty
]

{ #category : 'tests' }
JavaSmaCCTypeAnnotationsTest >> testTheTypeOfACastKeepsItsAnnotations [

	| cast |
	cast := (fastModel allWithType: FASTJavaCastExpression) anyOne.

	self assert: (cast type modifiers collect: [ :modifier | modifier name ]) asArray
		equals: #( 'Deprecated' )
]
