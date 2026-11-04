"
I check that a text block (JLS 3.10.6) is read as the string literal of its own kind that it is, and that it holds what the source writes between its two runs of three quote characters.
"
Class {
	#name : 'JavaSmaCCTextBlockTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'tests' }
JavaSmaCCTextBlockTest >> testAStringLiteralIsNotATextBlock [
	"JLS 3.10.5: a string literal is written between two quote characters, and nothing about
	it makes it a text block."

	| model |
	model := self parseClassString: self textBlockClass.
	self assert: (model allWithType: FASTJavaStringLiteral) size equals: 1.
	self
		assert: (model allWithType: FASTJavaStringLiteral) anyOne primitiveValue
		equals: 'hi'
]

{ #category : 'tests' }
JavaSmaCCTextBlockTest >> testATextBlockHoldsWhatIsWrittenBetweenItsDelimiters [
	"JLS 3.10.6: the delimiter of a text block is a run of three quote characters, so what it
	holds is what stands between the two runs, line terminators and indentation included and
	escapes unread, which is what a string literal holds between its two quotes."

	| block |
	block := ((self parseClassString: self textBlockClass) allWithType: FASTJavaTextBlock)
		         anyOne.
	self
		assert: block primitiveValue
		equals: (String cr join: #( '' '		a\tb' '		' ))
]

{ #category : 'tests' }
JavaSmaCCTextBlockTest >> testATextBlockIsAStringLiteralOfItsOwnKind [
	"JLS 3.10.6 writes a text block where JLS 3.10.5 writes a string literal, and the two are
	different productions, so a text block is an entity of its own and a string literal all
	the same."

	| model |
	model := self parseClassString: self textBlockClass.
	self assert: (model allWithType: FASTJavaTextBlock) size equals: 1.
	self assert: ((model allWithType: FASTJavaTextBlock) anyOne isKindOf: FASTJavaStringLiteral)
]

{ #category : 'tests' }
JavaSmaCCTextBlockTest >> testATextBlockKeepsAnEscapeAsItIsWritten [
	"The characters a literal holds are the ones the source writes, so an escape is still an
	escape once it is read, as it is in a string literal."

	| block |
	block := ((self parseClassString: self textBlockClass) allWithType: FASTJavaTextBlock)
		         anyOne.
	self assert: (block primitiveValue includesSubstring: 'a\tb')
]

{ #category : 'resources' }
JavaSmaCCTextBlockTest >> textBlockClass [
	"A class writing a string literal and a text block, so that the two can be told apart."

	^ 'class A {
	String plain = "hi";
	String block = """
		a\tb
		""";
}'
]
