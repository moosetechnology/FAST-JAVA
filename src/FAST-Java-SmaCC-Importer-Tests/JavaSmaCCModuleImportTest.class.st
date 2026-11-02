Class {
	#name : 'JavaSmaCCModuleImportTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCModuleImportTest >> javaClass [

	^ 'import module java.base;
import java.util.List;
import static java.util.Arrays.*;

class Imports { }'
]

{ #category : 'tests' }
JavaSmaCCModuleImportTest >> testModuleImportKeepsItsName [

	| import |
	import := (fastModel allWithType: FASTJavaImportDeclaration) detect: [ :each | each isModule ].

	self assert: import qualifiedName name equals: 'base'.
	self assert: import qualifiedName namespace name equals: 'java'
]

{ #category : 'tests' }
JavaSmaCCModuleImportTest >> testOnlyTheModuleImportIsOne [
	"JLS 7.5.5: `import module M;` names a module; every other form names a type."

	| imports |
	imports := fastModel allWithType: FASTJavaImportDeclaration.

	self assert: imports size equals: 3.
	self assert: (imports select: [ :each | each isModule ]) size equals: 1.
	self assert: (imports select: [ :each | each isStatic ]) size equals: 1.
	self assert: (imports select: [ :each | each isOnDemand ]) size equals: 1
]
