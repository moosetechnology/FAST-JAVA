"
I check that a compact canonical constructor (JLS 8.10.4.2) is told from a constructor declaring no parameter, which a record may also declare. Both import with no parameter, and the compact one was exported with a parameter list it does not write.
"
Class {
	#name : 'JavaSmaCCCompactConstructorTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCCompactConstructorTest >> javaClass [

	^ 'record R(int a) {
	R {
	}
	R() {
		this(1);
	}
}'
]

{ #category : 'tests' }
JavaSmaCCCompactConstructorTest >> testEachConstructorIsExportedAsWritten [

	| exported |
	exported := FASTJavaExportVisitor new export: (fastModel allWithType: FASTJavaCompilationUnit) anyOne.
	self assert: (exported includesSubstring: 'R {').
	self assert: (exported includesSubstring: 'R() {')
]

{ #category : 'tests' }
JavaSmaCCCompactConstructorTest >> testOnlyTheCompactConstructorIsCompact [

	| constructors |
	constructors := (fastModel allWithType: FASTJavaMethodEntity) sorted: [ :a :b | a startPos < b startPos ].
	self assert: (constructors collect: [ :constructor | constructor isCompactConstructor ]) asArray equals: #( true false )
]
