Class {
	#name : 'JavaSmaCCRecordTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCRecordTest >> javaClass [

	^ 'public record Point<T>(T x, int y) implements Shape {
	static int ORIGIN = 0;

	int sum() {
		return y;
	}
}

class Outer {
	record Inner(int v) {
	}
}'
]

{ #category : 'helpers' }
JavaSmaCCRecordTest >> pointRecord [

	^ (fastModel allWithType: FASTJavaCompilationUnit) anyOne recordDeclarations anyOne
]

{ #category : 'tests' }
JavaSmaCCRecordTest >> testMemberRecordIsADeclarationOfItsType [

	| member |
	member := (fastModel allWithType: FASTJavaClassDeclaration) anyOne declarations anyOne.
	self assert: member class equals: FASTJavaRecordDeclaration.
	self assert: member name equals: 'Inner'
]

{ #category : 'tests' }
JavaSmaCCRecordTest >> testRecordBodyDeclarations [

	| declarations |
	declarations := self pointRecord declarations.
	self assert: declarations first class equals: FASTJavaVarDeclStatement.
	self assert: declarations first declarators anyOne variable name equals: 'ORIGIN'.
	self assert: declarations second class equals: FASTJavaMethodEntity.
	self assert: declarations second name equals: 'sum'
]

{ #category : 'tests' }
JavaSmaCCRecordTest >> testRecordComponents [

	| components |
	components := self pointRecord components.
	self assertCollection: (components collect: [ :component | component variable name ]) equals: #( 'x' 'y' ) asOrderedCollection.
	self assert: components first type typeName name equals: 'T'.
	self assert: components second type class equals: FASTJavaIntTypeExpression
]

{ #category : 'tests' }
JavaSmaCCRecordTest >> testRecordIsACompilationUnitDeclaration [

	| record |
	record := self pointRecord.
	self assert: record class equals: FASTJavaRecordDeclaration.
	self assert: record name equals: 'Point'.
	self assert: record isRecordDeclaration.
	self deny: record isClassDeclaration.
	self
		assertCollection:
		(record modifiers select: [ :modifier | modifier isModifier ] thenCollect: [ :modifier | modifier token ])
		equals: #( 'public' ) asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCRecordTest >> testRecordTypeParametersAndInterfaces [

	| record |
	record := self pointRecord.
	self assertCollection: (record typeParameters collect: [ :parameter | parameter name ]) equals: #( 'T' ) asOrderedCollection.
	self
		assertCollection: (record interfaces collect: [ :interface | interface typeName name ])
		equals: #( 'Shape' ) asOrderedCollection
]
