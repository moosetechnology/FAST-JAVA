"
I check that an import on demand may name its package or type with a single identifier, as `import tools.*;` does. Its name is a name like any other, and building it as an expression made the import fail.
"
Class {
	#name : 'JavaSmaCCSingleNameImportOnDemandTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCSingleNameImportOnDemandTest >> javaClass [

	^ 'import tools.*;
import static Constants.*;

class A {
}'
]

{ #category : 'tests' }
JavaSmaCCSingleNameImportOnDemandTest >> testEachImportIsExportedAsWritten [

	| exported |
	exported := FASTJavaExportVisitor new export: (fastModel allWithType: FASTJavaCompilationUnit) anyOne.
	self assert: (exported lines first: 2) equals: #( 'import tools.*;' 'import static Constants.*;' )
]

{ #category : 'tests' }
JavaSmaCCSingleNameImportOnDemandTest >> testEachImportNamesWhatItImportsFrom [

	| imports |
	imports := (fastModel allWithType: FASTJavaImportDeclaration) sorted: [ :a :b | a startPos < b startPos ].
	self assert: (imports collect: [ :import | import qualifiedName fullName ]) asArray equals: #( 'tools' 'Constants' ).
	self assert: (imports collect: [ :import | import isStatic ]) asArray equals: #( false true ).
	self assert: (imports allSatisfy: [ :import | import isOnDemand ])
]
