Class {
	#name : 'JavaSmaCCAnnotationInterfaceTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'helpers' }
JavaSmaCCAnnotationInterfaceTest >> authorAnnotationInterface [

	^ (fastModel allWithType: FASTJavaCompilationUnit) anyOne annotationInterfaceDeclarations anyOne
]

{ #category : 'accessing' }
JavaSmaCCAnnotationInterfaceTest >> javaClass [

	^ '@Retention(RetentionPolicy.RUNTIME)
public @interface Author {
	String name() default "unknown";
	int revision();
}

class Document {
	@interface Internal {
	}
}'
]

{ #category : 'tests' }
JavaSmaCCAnnotationInterfaceTest >> testAnnotationInterfaceIsACompilationUnitDeclaration [

	| declaration |
	declaration := self authorAnnotationInterface.
	self assert: declaration class equals: FASTJavaAnnotationInterfaceDeclaration.
	self assert: declaration name equals: 'Author'.
	self assert: declaration isAnnotationInterfaceDeclaration.
	self deny: declaration isInterfaceDeclaration
]

{ #category : 'tests' }
JavaSmaCCAnnotationInterfaceTest >> testAnnotationInterfaceModifiers [

	| modifiers |
	modifiers := self authorAnnotationInterface modifiers.
	self
		assertCollection:
		(modifiers select: [ :modifier | modifier isModifier ] thenCollect: [ :modifier | modifier token ])
		equals: #( 'public' ) asOrderedCollection.
	self
		assertCollection:
		(modifiers select: [ :modifier | modifier isAnnotation ] thenCollect: [ :annotation | annotation name ])
		equals: #( 'Retention' ) asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCAnnotationInterfaceTest >> testAnnotationOnAnnotationInterfaceReadsItsElementsAsClassProperties [
	"A dotted name is read as a class property inside a type declaration and as a qualified
	name outside one, and an annotation interface is a type declaration."

	| annotation |
	annotation := self authorAnnotationInterface modifiers detect: [ :modifier | modifier isAnnotation ].
	self assert: annotation elements anyOne class equals: FASTJavaClassProperty
]

{ #category : 'tests' }
JavaSmaCCAnnotationInterfaceTest >> testElementDefaultValue [

	| elements |
	elements := self authorAnnotationInterface declarations.
	self assert: elements first defaultValue class equals: FASTJavaStringLiteral.
	self assert: elements first defaultValue primitiveValue equals: 'unknown'.
	self assert: elements second defaultValue isNil
]

{ #category : 'tests' }
JavaSmaCCAnnotationInterfaceTest >> testElementsAreDeclarations [

	| elements |
	elements := self authorAnnotationInterface declarations.
	self assert: (elements allSatisfy: [ :element | element isAnnotationElementDeclaration ]).
	self assertCollection: (elements collect: [ :element | element name ]) equals: #( 'name' 'revision' ) asOrderedCollection.
	self assert: elements first type typeName name equals: 'String'.
	self assert: elements second type class equals: FASTJavaIntTypeExpression
]

{ #category : 'tests' }
JavaSmaCCAnnotationInterfaceTest >> testMemberAnnotationInterface [

	| member |
	member := (fastModel allWithType: FASTJavaClassDeclaration) anyOne declarations anyOne.
	self assert: member class equals: FASTJavaAnnotationInterfaceDeclaration.
	self assert: member name equals: 'Internal'
]
