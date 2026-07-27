Class {
	#name : 'JavaSmaCCSourceTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaClass [
	^ String streamContents: [ :s |
		s << 'class A {'.
		s cr tab << self javaMethod.
		s cr << '}' ]
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaClassWithInitializer [
	^ String streamContents: [ :s |
		s << 'class A {'.
		s cr tab << self javaInitializer.
		s cr << '}' ]
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaClassWithInnerClass [
	^ String streamContents: [ :s |
		s << 'class Outer {'.
		s cr tab << self javaInnerClass.
		s cr << '}' ]
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaCompilationUnit [
	^ String streamContents: [ :s |
		s << self javaPackageDeclaration.
		s cr << self javaImportDeclaration.
		s cr << self javaClass ]
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaCompilationUnitWithEnum [
	^ String streamContents: [ :s |
		s << self javaPackageDeclaration.
		s cr << self javaEnum ]
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaCompilationUnitWithInitializer [
	^ String streamContents: [ :s |
		s << self javaPackageDeclaration.
		s cr << self javaClassWithInitializer ]
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaCompilationUnitWithInnerClass [
	^ String streamContents: [ :s |
		s << self javaPackageDeclaration.
		s cr << self javaClassWithInnerClass ]
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaCompilationUnitWithInterface [
	^ String streamContents: [ :s |
		s << self javaPackageDeclaration.
		s cr << self javaInterface ]
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaEnum [
	^ 'enum E {}'
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaImportDeclaration [
	^ 'import com.Example;'
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaInitializer [
	^ '{}'
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaInnerClass [
	^ String streamContents: [ :s |
		s << 'class Inner {'.
		s cr tab tab << self javaMethodOfInnerClass.
		s cr tab << '}' ]
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaInterface [
	^ 'interface I {}'
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaMethod [
	^ String streamContents: [ :s |
		s << 'void hello() {'.
		s cr tab tab << 'int i = 0;'.
		s cr tab << '}' ]
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaMethodOfInnerClass [
	^ 'void inner() {}'
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaPackageDeclaration [
	^ 'package org.moose;'
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testClassSourceCode [

	| sourceText |
	sourceText := self javaClass.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaClassDeclaration) anyOne sourceCode equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testClassSourceCodeInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnit.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaClassDeclaration) anyOne sourceCode equals: self javaClass
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testClassSourceText [

	| sourceText |
	sourceText := self javaClass.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaClassDeclaration) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testClassSourceTextInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnit.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaClassDeclaration) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testCompilationUnitSourceCode [

	| sourceText |
	sourceText := self javaCompilationUnit.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaCompilationUnit) anyOne sourceCode equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testCompilationUnitSourceText [

	| sourceText |
	sourceText := self javaCompilationUnit.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaCompilationUnit) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testEnumSourceCode [

	| sourceText |
	sourceText := self javaEnum.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaEnumDeclaration) anyOne sourceCode equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testEnumSourceCodeInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnitWithEnum.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaEnumDeclaration) anyOne sourceCode equals: self javaEnum
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testEnumSourceText [

	| sourceText |
	sourceText := self javaEnum.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaEnumDeclaration) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testEnumSourceTextInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnitWithEnum.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaEnumDeclaration) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testImportDeclarationSourceCode [

	| sourceText |
	sourceText := self javaCompilationUnit.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaImportDeclaration) anyOne sourceCode equals: self javaImportDeclaration
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testImportDeclarationSourceText [

	| sourceText |
	sourceText := self javaCompilationUnit.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaImportDeclaration) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInitializerSourceCode [

	| sourceText |
	sourceText := self javaInitializer.
	fastModel := self parseMethodString: sourceText.

	self assert: (fastModel allWithType: FASTJavaInitializer) anyOne sourceCode equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInitializerSourceCodeInClass [

	| sourceText |
	sourceText := self javaClassWithInitializer.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaInitializer) anyOne sourceCode equals: self javaInitializer
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInitializerSourceCodeInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnitWithInitializer.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaInitializer) anyOne sourceCode equals: self javaInitializer
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInitializerSourceText [

	| sourceText |
	sourceText := self javaInitializer.
	fastModel := self parseMethodString: sourceText.

	self assert: (fastModel allWithType: FASTJavaInitializer) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInitializerSourceTextInClass [

	| sourceText |
	sourceText := self javaClassWithInitializer.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaInitializer) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInitializerSourceTextInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnitWithInitializer.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaInitializer) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInnerClassSourceCodeInClass [

	| sourceText |
	sourceText := self javaClassWithInnerClass.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaClassDeclaration) second sourceCode equals: self javaInnerClass
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInnerClassSourceCodeInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnitWithInnerClass.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaClassDeclaration) second sourceCode equals: self javaInnerClass
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInnerClassSourceTextInClass [

	| sourceText |
	sourceText := self javaClassWithInnerClass.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaClassDeclaration) second sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInnerClassSourceTextInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnitWithInnerClass.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaClassDeclaration) second sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInterfaceSourceCode [

	| sourceText |
	sourceText := self javaInterface.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaInterfaceDeclaration) anyOne sourceCode equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInterfaceSourceCodeInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnitWithInterface.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaInterfaceDeclaration) anyOne sourceCode equals: self javaInterface
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInterfaceSourceText [

	| sourceText |
	sourceText := self javaInterface.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaInterfaceDeclaration) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testInterfaceSourceTextInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnitWithInterface.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaInterfaceDeclaration) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testMethodOfInnerClassSourceCode [

	| sourceText |
	sourceText := self javaCompilationUnitWithInnerClass.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceCode equals: self javaMethodOfInnerClass
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testMethodOfInnerClassSourceText [

	| sourceText |
	sourceText := self javaCompilationUnitWithInnerClass.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testMethodSourceCode [

	| sourceText |
	sourceText := self javaMethod.
	fastModel := self parseMethodString: sourceText.

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceCode equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testMethodSourceCodeInClass [

	| sourceText |
	sourceText := self javaClass.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceCode equals: self javaMethod
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testMethodSourceCodeInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnit.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceCode equals: self javaMethod
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testMethodSourceText [

	| sourceText |
	sourceText := self javaMethod.
	fastModel := self parseMethodString: sourceText.

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testMethodSourceTextInClass [

	| sourceText |
	sourceText := self javaClass.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testMethodSourceTextInCompilationUnit [

	| sourceText |
	sourceText := self javaCompilationUnit.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceText equals: sourceText
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testPackageDeclarationSourceCode [

	| sourceText |
	sourceText := self javaCompilationUnit.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaPackageDeclaration) anyOne sourceCode equals: self javaPackageDeclaration
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testPackageDeclarationSourceText [

	| sourceText |
	sourceText := self javaCompilationUnit.
	fastModel := self parseClassString: sourceText.

	self assert: (fastModel allWithType: FASTJavaPackageDeclaration) anyOne sourceText equals: sourceText
]
