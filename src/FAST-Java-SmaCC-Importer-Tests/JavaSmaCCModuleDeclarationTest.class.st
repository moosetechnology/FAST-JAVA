Class {
	#name : 'JavaSmaCCModuleDeclarationTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCModuleDeclarationTest >> javaClass [

	^ 'import java.util.List;

@Deprecated
module com.example.app {
	requires java.base;
	requires transitive java.logging;
	requires static transitive java.sql;
	exports com.example.api;
	exports com.example.internal to java.logging, java.desktop;
	opens com.example.model;
	opens com.example.secret to java.logging;
	uses com.example.api.Service;
	provides com.example.api.Service with com.example.internal.Impl, com.example.internal.Impl2;
}'
]

{ #category : 'tests' }
JavaSmaCCModuleDeclarationTest >> testAnOpenModuleIsOpen [
	"JLS 7.7: `open` opens every package the module holds, which is why such a module
	writes no `opens` directive of its own."

	| module |
	module := (self parseClassString: 'open module m { requires java.base; }') allWithType: FASTJavaModuleDeclaration.

	self assert: module anyOne isOpen.
	self assert: module anyOne qualifiedName fullName equals: 'm'
]

{ #category : 'tests' }
JavaSmaCCModuleDeclarationTest >> testExportsAndOpensKeepTheModulesTheyAreAddressedTo [
	"JLS 7.7.2: a package is exported or opened to every module where no `to` is written,
	and to the modules written after it where there is one."

	| exports opens |
	exports := fastModel allWithType: FASTJavaExportsDirective.
	opens := fastModel allWithType: FASTJavaOpensDirective.

	self
		assert: (exports collect: [ :each | each qualifiedName fullName ]) asArray
		equals: #( 'com.example.api' 'com.example.internal' ).
	self assert: exports first targets isEmpty.
	self assert: (exports second targets collect: [ :each | each fullName ]) asArray equals: #( 'java.logging' 'java.desktop' ).

	self
		assert: (opens collect: [ :each | each qualifiedName fullName ]) asArray
		equals: #( 'com.example.model' 'com.example.secret' ).
	self assert: opens first targets isEmpty.
	self assert: (opens second targets collect: [ :each | each fullName ]) asArray equals: #( 'java.logging' )
]

{ #category : 'tests' }
JavaSmaCCModuleDeclarationTest >> testRequiresKeepsItsModifiers [
	"JLS 7.7.1: `static` asks for the module at compile time only and `transitive` passes
	it on, and a directive may write both."

	| requires |
	requires := fastModel allWithType: FASTJavaRequiresDirective.

	self
		assert: (requires collect: [ :each | each qualifiedName fullName ]) asArray
		equals: #( 'java.base' 'java.logging' 'java.sql' ).
	self assert: (requires collect: [ :each | each isStatic ]) asArray equals: #( false false true ).
	self assert: (requires collect: [ :each | each isTransitive ]) asArray equals: #( false true true )
]

{ #category : 'tests' }
JavaSmaCCModuleDeclarationTest >> testTheDirectivesAreKeptInTheOrderTheyAreWritten [
	"JLS 7.7.1: a module writes its directives in any order it likes, so they are kept in
	the one it writes."

	| module |
	module := (fastModel allWithType: FASTJavaModuleDeclaration) anyOne.

	self
		assert: (module directives collect: [ :directive | directive class name ]) asArray
		equals: #( 'FASTJavaRequiresDirective' 'FASTJavaRequiresDirective' 'FASTJavaRequiresDirective' 'FASTJavaExportsDirective'
			   'FASTJavaExportsDirective' 'FASTJavaOpensDirective' 'FASTJavaOpensDirective' 'FASTJavaUsesDirective' 'FASTJavaProvidesDirective' )
]

{ #category : 'tests' }
JavaSmaCCModuleDeclarationTest >> testTheUnitDeclaresTheModuleAndNoType [
	"JLS 7.7: a modular compilation unit declares one module and no type of its own, and
	writes before it the imports the directives read through."

	| unit module |
	unit := (fastModel allWithType: FASTJavaCompilationUnit) anyOne.
	module := unit moduleDeclaration.

	self assert: module isNotNil.
	self assert: unit classDeclarations isEmpty.
	self assert: unit importDeclarations size equals: 1.
	self assert: module qualifiedName fullName equals: 'com.example.app'.
	self deny: module isOpen.
	self assert: (module modifiers collect: [ :modifier | modifier name ]) asArray equals: #( 'Deprecated' )
]

{ #category : 'tests' }
JavaSmaCCModuleDeclarationTest >> testUsesAndProvidesNameTheirService [
	"JLS 7.7.3 and 7.7.4: `uses` names a service alone, where `provides` names it with the
	classes implementing it."

	| uses provides |
	uses := (fastModel allWithType: FASTJavaUsesDirective) anyOne.
	provides := (fastModel allWithType: FASTJavaProvidesDirective) anyOne.

	self assert: uses qualifiedName fullName equals: 'com.example.api.Service'.
	self assert: provides qualifiedName fullName equals: 'com.example.api.Service'.
	self
		assert: (provides implementations collect: [ :each | each fullName ]) asArray
		equals: #( 'com.example.internal.Impl' 'com.example.internal.Impl2' )
]
