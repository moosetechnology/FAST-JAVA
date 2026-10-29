Class {
	#name : 'JavaSmaCCDeclarationModifiersTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCDeclarationModifiersTest >> javaClass [

	^ 'enum Modifiers {

	@Deprecated ANNOTATED, PLAIN;

	void newMethod(Object value, Iterable<String> words) {
		try {
			run();
		} catch (@SuppressWarnings("caught") final Error error) {
			handle(error);
		}
		for (@SuppressWarnings("each") final String word : words) {
			use(word);
		}
		if (value instanceof @SuppressWarnings("matched") final String text) {
			use(text);
		}
	}
}'
]

{ #category : 'resources' }
JavaSmaCCDeclarationModifiersTest >> modifiersOf: aFASTJavaEntity [

	^ aFASTJavaEntity modifiers asOrderedCollection
]

{ #category : 'tests' }
JavaSmaCCDeclarationModifiersTest >> testCatchParameterKeepsItsModifiers [
	"JLS 14.20: a catch clause writes a formal parameter, which may write modifiers before
	the types it catches. The catch part holds them, as it already holds those types and
	the name the parameter declares."

	| modifiers |
	modifiers := self modifiersOf: (fastModel allWithType: FASTJavaCatchPartStatement) anyOne.
	self assert: modifiers size equals: 2.
	self assert: modifiers first name equals: 'SuppressWarnings'.
	self assert: modifiers second token equals: 'final'
]

{ #category : 'tests' }
JavaSmaCCDeclarationModifiersTest >> testEnumConstantKeepsItsAnnotation [
	"JLS 8.9.1: the only modifier a constant may write is an annotation, and a constant
	that writes none keeps an empty collection."

	| constants |
	constants := (fastModel allWithType: FASTJavaEnumConstant) asOrderedCollection.
	self
		assert: (self modifiersOf: (constants detect: [ :constant | constant name = 'ANNOTATED' ])) size
		equals: 1.
	self
		assert: (self modifiersOf: (constants detect: [ :constant | constant name = 'ANNOTATED' ])) first name
		equals: 'Deprecated'.
	self assert:
		(self modifiersOf: (constants detect: [ :constant | constant name = 'PLAIN' ])) isEmpty
]

{ #category : 'tests' }
JavaSmaCCDeclarationModifiersTest >> testForEachVariableKeepsItsModifiers [
	"JLS 14.14.2: the variable a for-each writes is a local variable declaration, so it may
	write modifiers the same way as one written as a statement."

	| modifiers |
	modifiers := self modifiersOf: (fastModel allWithType: FASTJavaForEachStatement) anyOne.
	self assert: modifiers size equals: 2.
	self assert: modifiers first name equals: 'SuppressWarnings'.
	self assert: modifiers second token equals: 'final'
]

{ #category : 'tests' }
JavaSmaCCDeclarationModifiersTest >> testTypePatternKeepsItsModifiers [
	"JLS 14.30.1: a type pattern declares its variable the way a local variable declaration
	does, modifiers included."

	| modifiers |
	modifiers := self modifiersOf: (fastModel allWithType: FASTJavaTypePattern) anyOne.
	self assert: modifiers size equals: 2.
	self assert: modifiers first name equals: 'SuppressWarnings'.
	self assert: modifiers second token equals: 'final'
]

{ #category : 'tests' }
JavaSmaCCDeclarationModifiersTest >> testTypePatternStartsAtItsFirstModifier [
	"A pattern that writes modifiers begins where they begin, not at the type it matches,
	so that the source it covers is the source it writes."

	| pattern |
	pattern := (fastModel allWithType: FASTJavaTypePattern) anyOne.
	self assert: pattern startPos < pattern type startPos
]
