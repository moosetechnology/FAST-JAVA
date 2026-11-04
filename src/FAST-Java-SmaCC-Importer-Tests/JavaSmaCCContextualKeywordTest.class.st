"
I check that a contextual keyword of JLS 3.9 still names what it is written on. These sixteen character sequences are keywords only where the grammar reads one, and ordinary identifiers everywhere else, so `int record = 5;`, `Thread.yield()` and `yield: while (true) {}` must read as javac reads them.

`yield` carries the sharpest of the two readings, since JLS 14.21 makes a statement of the expression written after it, so it is checked on its own as well.
"
Class {
	#name : 'JavaSmaCCContextualKeywordTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCContextualKeywordTest >> contextualKeywords [
	"JLS 3.9: the sixteen character sequences that are keywords where the grammar reads one
	and ordinary identifiers everywhere else."

	^ #( 'exports' 'module' 'open' 'opens' 'permits' 'provides' 'record' 'requires'
	     'sealed' 'to' 'transitive' 'uses' 'var' 'when' 'with' 'yield' )
]

{ #category : 'tests' }
JavaSmaCCContextualKeywordTest >> testAContextualKeywordLabelsAStatement [
	"JLS 14.7: a label is an identifier, and JLS 3.9 keeps none of the contextual keywords
	from being one."

	self contextualKeywords do: [ :keyword |
		| model |
		model := self parseClassString:
			         'class A { void m() { ' , keyword
			         , ': while (true) { break ' , keyword , '; } } }'.
		self assert: (model allWithType: FASTJavaLabeledStatement) anyOne label equals: keyword.
		self assert: (model allWithType: FASTJavaBreakStatement) anyOne label equals: keyword ]
]

{ #category : 'tests' }
JavaSmaCCContextualKeywordTest >> testAContextualKeywordNamesAFieldAndTheReadOfIt [

	self contextualKeywords do: [ :keyword |
		| model |
		model := self parseClassString:
			         'class A { int ' , keyword , '; int f() { return ' , keyword , '; } }'.
		self
			assert: (model allWithType: FASTJavaVarDeclStatement) anyOne declarators anyOne
					variable name
			equals: keyword.
		self
			assert: (model allWithType: FASTJavaReturnStatement) anyOne expression name
			equals: keyword ]
]

{ #category : 'tests' }
JavaSmaCCContextualKeywordTest >> testAContextualKeywordNamesALocalVariable [

	self contextualKeywords do: [ :keyword |
		| declaration |
		declaration := ((self parseClassString:
			                  'class A { void m() { int ' , keyword , ' = 5; } }')
			                 allWithType: FASTJavaVarDeclStatement) anyOne.
		self assert: declaration declarators anyOne variable name equals: keyword ]
]

{ #category : 'tests' }
JavaSmaCCContextualKeywordTest >> testAContextualKeywordNamesAMethodAndTheInvocationOfIt [

	self contextualKeywords do: [ :keyword |
		| model |
		model := self parseClassString:
			         'class A { void ' , keyword , '() {} void n() { this.' , keyword , '(); } }'.
		self
			assertCollection: ((model allWithType: FASTJavaMethodEntity) collect: [ :each |
					 each name ]) asSet
			hasSameElements: { keyword. 'n' }.
		self assert: (model allWithType: FASTJavaMethodInvocation) anyOne name equals: keyword ]
]

{ #category : 'tests' }
JavaSmaCCContextualKeywordTest >> testAContextualKeywordNamesAParameter [

	self contextualKeywords do: [ :keyword |
		| parameter |
		parameter := ((self parseClassString:
			               'class A { void m(int ' , keyword , ') {} }')
			              allWithType: FASTJavaParameter) anyOne.
		self assert: parameter variable name equals: keyword ]
]

{ #category : 'tests' }
JavaSmaCCContextualKeywordTest >> testAYieldStatementHoldsTheExpressionItYields [
	"JLS 14.21: the expression a yield statement writes may itself name a variable named
	`yield`, which is a name and not a second yield."

	| statement |
	statement := ((self parseMethodString:
		               'int m(int a) { int yield = 2; return switch (a) { default -> { yield yield; } }; }')
		              allWithType: FASTJavaYieldStatement) anyOne.
	self assert: statement expression class equals: FASTJavaVariableExpression.
	self assert: statement expression name equals: 'yield'
]

{ #category : 'tests' }
JavaSmaCCContextualKeywordTest >> testYieldIsAStatementOnlyWhereItYieldsAValue [
	"JLS 14.21: `yield` makes a statement of the expression written after it. Written where no
	expression follows it, it names what it stands on and yields nothing."

	self assertEmpty: ((self parseClassString:
			  'class A { int yield; void m() { yield = 1; yield++; } }')
			 allWithType: FASTJavaYieldStatement).
	self
		assert: ((self parseClassString:
				  'class A { int m(int a) { return switch (a) { default -> { yield 1; } }; } }')
				 allWithType: FASTJavaYieldStatement) size
		equals: 1
]

{ #category : 'tests' }
JavaSmaCCContextualKeywordTest >> testYieldNamesTheMethodAReferenceReaches [
	"JLS 15.13: a method reference names the method it reaches, and `yield` names one like
	any other identifier."

	self
		assert: ((self parseMethodString: 'Runnable m() { return Thread::yield; }')
			 allWithType: FASTJavaMethodReference) anyOne name
		equals: 'yield'
]

{ #category : 'tests' }
JavaSmaCCContextualKeywordTest >> testYieldNamesTheMethodItInvokes [
	"JLS 15.12: `Thread.yield()` invokes a method named `yield`. Only an unqualified call of
	one is kept out of a statement, by JLS 15.12.1, which is why the JDK writes it qualified."

	| model |
	model := self parseClassString: 'class A { void m() { Thread.yield(); } }'.
	self assert: (model allWithType: FASTJavaMethodInvocation) anyOne name equals: 'yield'.
	self assertEmpty: (model allWithType: FASTJavaYieldStatement)
]
