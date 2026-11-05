"
I check that an expression written between parentheses (JLS 15.8.5) remembers how many pairs are written around it, whether the precedence of the operators needs them or not, and is exported with them.
"
Class {
	#name : 'JavaSmaCCParenthesizedExpressionTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCParenthesizedExpressionTest >> javaClass [

	^ 'class A {
	int f = ((1)) + (2 + 3) * 4;
	int m(String s) {
		return (s).length();
	}
}'
]

{ #category : 'tests' }
JavaSmaCCParenthesizedExpressionTest >> testEachExpressionCountsItsParentheses [

	| literals |
	literals := (fastModel allWithType: FASTJavaIntegerLiteral) sorted: [ :a :b | a startPos < b startPos ].
	self
		assert: (literals collect: [ :literal | literal numberOfParentheses ]) asArray
		equals: #( 2 nil nil nil ).
	self assert: literals second infixOperationLeftOperandOwner numberOfParentheses equals: 1
]

{ #category : 'tests' }
JavaSmaCCParenthesizedExpressionTest >> testParenthesesAreExportedAsWritten [

	| exported |
	exported := FASTJavaExportVisitor new export: (fastModel allWithType: FASTJavaCompilationUnit) anyOne.
	self assert: (exported includesSubstring: '((1))+(2+3)*4').
	self assert: (exported includesSubstring: '(s).length()')
]
