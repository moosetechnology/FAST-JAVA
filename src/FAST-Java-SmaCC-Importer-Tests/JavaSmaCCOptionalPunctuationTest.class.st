"
I check that the punctuation JLS 8.9, 9.7.1, 10.6 and 14.20.3 write as optional elements of their productions reaches the model, so that a file writing it is written back as it stands.
"
Class {
	#name : 'JavaSmaCCOptionalPunctuationTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCOptionalPunctuationTest >> enumNamed: aString [
	^ (fastModel allWithType: FASTJavaEnumDeclaration) detect: [ :each | each name = aString ]
]

{ #category : 'accessing' }
JavaSmaCCOptionalPunctuationTest >> javaClass [
	^ 'class OptionalPunctuation {
	int[] trailing = { 1, 2, };
	int[] plain = { 1, 2 };
	@Names({ "a", "b", })
	int annotated;
	enum WithComma { A, B, }
	enum WithSemicolon { A, B; }
	enum Bare { A, B }
	enum WithMembers { A, B; void m() { } }
	void resources(InputStream i) throws Exception {
		try (InputStream a = i; InputStream b = i;) { }
		try (InputStream c = i; InputStream d = i) { }
	}
}'
]

{ #category : 'tests' }
JavaSmaCCOptionalPunctuationTest >> testAResourceListKeepsASemicolonAfterItsLastResource [
	"JLS 14.20.3 allows a semicolon after the last resource, which the model says was
	written rather than deriving it from how many resources there are."

	| tries |
	tries := (fastModel allWithType: FASTJavaTryCatchStatement)
		         sorted: [ :a :b | a startPos < b startPos ].
	self assert: tries first hasTrailingSemicolon.
	self deny: tries second hasTrailingSemicolon
]

{ #category : 'tests' }
JavaSmaCCOptionalPunctuationTest >> testAnAnnotationArrayKeepsACommaAfterItsLastValue [
	"JLS 9.7.1 allows the comma after the last value of an element array, as JLS 10.6
	does after the last initializer of an array."

	| element |
	element := (fastModel allWithType: FASTJavaArrayAnnotationElement) anyOne.
	self assert: element hasTrailingComma
]

{ #category : 'tests' }
JavaSmaCCOptionalPunctuationTest >> testAnArrayInitializerKeepsACommaAfterItsLastInitializer [
	"JLS 10.6 writes the comma after the last initializer as an element of the production
	of its own, so a model that cannot say whether it was written cannot write the array
	back as the source had it."

	| initializers |
	initializers := (fastModel allWithType: FASTJavaArrayInitializer)
		                sorted: [ :a :b | a startPos < b startPos ].
	self assert: initializers first hasTrailingComma.
	self deny: initializers second hasTrailingComma
]

{ #category : 'tests' }
JavaSmaCCOptionalPunctuationTest >> testAnArrayInitializerOfOnlyACommaHasATrailingComma [
	"JLS 10.6 writes the list of initializers and the comma after it as optional elements
	alike, so `{ , }` is an array of none that writes one."

	| initializer |
	initializer := ((JavaSmaCCProgramNodeImporterVisitor new parseCodeString:
			          'class OnlyAComma { int[] empty = { }; int[] comma = { , }; }')
			         allWithType: FASTJavaArrayInitializer) asArray
		               sorted: [ :a :b | a startPos < b startPos ].
	self deny: initializer first hasTrailingComma.
	self assert: initializer second hasTrailingComma
]

{ #category : 'tests' }
JavaSmaCCOptionalPunctuationTest >> testAnEnumKeepsACommaAfterItsLastConstant [
	"JLS 8.9 writes the comma after the last constant as an element of its own."

	| withComma bare |
	withComma := self enumNamed: 'WithComma'.
	bare := self enumNamed: 'Bare'.
	self assert: withComma hasTrailingComma.
	self deny: bare hasTrailingComma
]

{ #category : 'tests' }
JavaSmaCCOptionalPunctuationTest >> testAnEnumThatImplementsInterfacesHasNoTrailingComma [
	"The commas separating the interfaces an enum implements are gathered with the ones
	separating its constants, so counting them says a trailing comma was written where
	none was. Where the comma stands is what tells it apart."

	| enum |
	enum := ((JavaSmaCCProgramNodeImporterVisitor new parseCodeString:
			   'enum Days implements Temporal, Adjuster { MONDAY, TUESDAY, SUNDAY; int x; }')
			  allWithType: FASTJavaEnumDeclaration) anyOne.
	self deny: enum hasTrailingComma.
	self assert: enum hasBodySemicolon
]

{ #category : 'tests' }
JavaSmaCCOptionalPunctuationTest >> testAnEnumWithNoMemberKeepsTheSemicolonOpeningItsBody [
	"JLS 8.9: the semicolon opens the body, so an enum declaring members writes it either
	way and one declaring none writes it only where the source did."

	self assert: (self enumNamed: 'WithSemicolon') hasBodySemicolon.
	self deny: (self enumNamed: 'Bare') hasBodySemicolon.
	self assert: (self enumNamed: 'WithMembers') hasBodySemicolon.
	self deny: (self enumNamed: 'WithComma') hasBodySemicolon
]
