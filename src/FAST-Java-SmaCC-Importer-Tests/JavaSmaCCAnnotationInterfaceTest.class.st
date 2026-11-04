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
	"JLS 9.6: an annotation interface writes keywords and annotations before `@interface`,
	and the model holds the keywords apart from the annotations."

	| declaration |
	declaration := self authorAnnotationInterface.
	self
		assertCollection: (declaration modifiers collect: [ :modifier | modifier token ] as: OrderedCollection)
		equals: #( 'public' ) asOrderedCollection.
	self
		assertCollection: (declaration annotations collect: [ :annotation | annotation type name ] as: OrderedCollection)
		equals: #( 'Retention' ) asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCAnnotationInterfaceTest >> testAnnotationOnAnnotationInterfaceReadsItsElementsAsQualifiedNames [
	"JLS 6.5: a dotted name is read the same way wherever it stands, an annotation element
	included, since a parser cannot tell a package from a type from a field."

	| annotation |
	annotation := self authorAnnotationInterface annotations anyOne.
	self assert: annotation elements anyOne class equals: FASTJavaQualifiedName
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
