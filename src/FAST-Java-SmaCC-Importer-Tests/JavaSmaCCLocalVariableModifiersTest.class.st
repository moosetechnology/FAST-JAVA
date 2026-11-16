Class {
	#name : 'JavaSmaCCLocalVariableModifiersTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCLocalVariableModifiersTest >> javaMethod [

	^ 'void newMethod() {
	@SuppressWarnings("alone") final int plain = 0;
	try (@SuppressWarnings("resource") final InputStream stream = open()) {
		use(stream);
	}
	for (@SuppressWarnings("loop") final int index = 0; index < 10; index++) {
		step();
	}
}'
]

{ #category : 'resources' }
JavaSmaCCLocalVariableModifiersTest >> modifiersOfDeclarationOf: aVariableName [

	^ ((fastModel allWithType: FASTJavaVarDeclStatement) detect: [ :declaration |
		   declaration declarators asOrderedCollection anySatisfy: [ :declarator | declarator variable name = aVariableName ] ])
		  modifiers asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCLocalVariableModifiersTest >> testDeclarationStandingOnItsOwnKeepsItsModifiers [
	"JLS 14.4: a local variable declaration statement writes its modifiers before its
	type. This is the case that already worked, and it is here to say that the two below
	ask for nothing new."

	| modifiers |
	modifiers := self modifiersOfDeclarationOf: 'plain'.
	self assert: modifiers size equals: 2.
	self assert: modifiers first name equals: 'SuppressWarnings'.
	self assert: modifiers second token equals: 'final'
]

{ #category : 'tests' }
JavaSmaCCLocalVariableModifiersTest >> testResourceOfATryKeepsItsModifiers [
	"JLS 14.20.3: a resource is a local variable declaration, so it may write modifiers
	before its type like any other. Losing `final` there changes what the declaration
	says, and losing the annotation changes what the compiler is told about it."

	| modifiers |
	modifiers := self modifiersOfDeclarationOf: 'stream'.
	self assert: modifiers size equals: 2.
	self assert: modifiers first name equals: 'SuppressWarnings'.
	self assert: modifiers second token equals: 'final'
]

{ #category : 'tests' }
JavaSmaCCLocalVariableModifiersTest >> testVariableOfAForKeepsItsModifiers [
	"JLS 14.14.1: the first part of a for header may write a local variable declaration,
	which carries its modifiers the same way as one written as a statement."

	| modifiers |
	modifiers := self modifiersOfDeclarationOf: 'index'.
	self assert: modifiers size equals: 2.
	self assert: modifiers first name equals: 'SuppressWarnings'.
	self assert: modifiers second token equals: 'final'
]
