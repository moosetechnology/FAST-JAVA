Class {
	#name : 'JavaSmaCCUnicodeEscapeTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'tests' }
JavaSmaCCUnicodeEscapeTest >> testABackslashAnEscapeWritesStartsNoEscapeOfItsOwn [
	"JLS 3.3 is one pass, so `'\u005cu0041'` reads as `'\u0041'`, and JLS 3.10.7 lists no
	`\u` among the escape sequences a literal may write. javac rejects it, and so do we."

	self
		should: [ self parseMethodString: 'void m() { char c = ''\u005cu0041''; }' ]
		raise: SmaCCParserError
]

{ #category : 'tests' }
JavaSmaCCUnicodeEscapeTest >> testACharacterLiteralKeepsTheEscapeItIsWrittenWith [
	"JLS 3.3: the escape is translated before the literal is read, but the literal still holds
	the characters the source writes."

	| literals |
	literals := (self parseMethodString: 'void m() { char c = ''\u00e9''; }')
		            allWithType: FASTJavaCharacterLiteral.
	self assert: literals size equals: 1.
	self assert: literals anyOne primitiveValue equals: '\u00e9'
]

{ #category : 'tests' }
JavaSmaCCUnicodeEscapeTest >> testAKeywordMayBeWrittenWithAnEscape [
	"JLS 3.3: `cl\u0061ss` reads as the keyword, because the scanner only ever sees `class`."

	self
		assert: ((self parseClassString: 'cl\u0061ss A {}') allWithType: FASTJavaClassDeclaration) size
		equals: 1
]

{ #category : 'tests' }
JavaSmaCCUnicodeEscapeTest >> testAUThatFourHexadecimalDigitsDoNotFollowIsAnError [
	"JLS 3.3: an eligible backslash and a u that four hexadecimal digits do not follow is a
	compile-time error."

	self
		should: [ self parseMethodString: 'void m() { char c = ''\u12''; }' ]
		raise: SmaCCParserError
]

{ #category : 'tests' }
JavaSmaCCUnicodeEscapeTest >> testAnEscapeMayBeWrittenWithMoreThanOneU [
	"JLS 3.3: the backslash is followed by one or more u, so `\uu0041` is an escape."

	| literals |
	literals := (self parseMethodString: 'void m() { char c = ''\uu0041''; }')
		            allWithType: FASTJavaCharacterLiteral.
	self assert: literals size equals: 1.
	self assert: literals anyOne primitiveValue equals: '\uu0041'
]

{ #category : 'tests' }
JavaSmaCCUnicodeEscapeTest >> testAnEscapeThatWritesABackslashEscapesWhatComesAfterIt [
	"JLS 3.3: translation comes first, so the backslash `\u005c` writes is the backslash of an
	escape sequence. `'\u005cn'` is one character literal, holding a newline."

	| literals |
	literals := (self parseMethodString: 'void m() { char c = ''\u005cn''; }')
		            allWithType: FASTJavaCharacterLiteral.
	self assert: literals size equals: 1.
	self assert: literals anyOne primitiveValue equals: '\u005cn'
]

{ #category : 'tests' }
JavaSmaCCUnicodeEscapeTest >> testAnIdentifierMayBeWrittenWithAnEscape [
	"JLS 3.3: translation comes before the scanner reads, so an escape stands anywhere a
	character stands, the spelling of a name included."

	| variables |
	variables := (self parseMethodString: 'void m() { int \u0061 = 1; }')
		             allWithType: FASTJavaVariableExpression.
	self assert: variables size equals: 1.
	self assert: variables anyOne name equals: '\u0061'
]

{ #category : 'tests' }
JavaSmaCCUnicodeEscapeTest >> testAnOddNumberOfBackslashesLeavesTheTextUntranslated [
	"JLS 3.3: a backslash starts an escape only when an even number of backslashes precedes
	it, so `\\u0041` writes a backslash and the text u0041."

	| literals |
	literals := (self parseMethodString: 'void m() { String s = "\\u0041"; }')
		            allWithType: FASTJavaStringLiteral.
	self assert: literals size equals: 1.
	self assert: literals anyOne primitiveValue equals: '\\u0041'
]
