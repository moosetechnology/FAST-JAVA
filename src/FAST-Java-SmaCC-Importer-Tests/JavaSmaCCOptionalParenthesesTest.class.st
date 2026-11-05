"
I check the parentheses a source may write or leave out without changing what it declares: those around the one parameter of a lambda (JLS 15.27.1), and those of an annotation giving no element value (JLS 9.7) or of an enum constant giving no argument (JLS 8.9.1). Each is exported as written.
"
Class {
	#name : 'JavaSmaCCOptionalParenthesesTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCOptionalParenthesesTest >> javaClass [

	^ 'class A {
	@M
	@N()
	void m() {
		f(x -> x, (y) -> y, (int z) -> z);
	}
	enum E {
		C, D()
	}
}'
]

{ #category : 'tests' }
JavaSmaCCOptionalParenthesesTest >> testEachFormIsExportedAsWritten [

	| exported |
	exported := FASTJavaExportVisitor new export: (fastModel allWithType: FASTJavaCompilationUnit) anyOne.
	self assert: (exported includesSubstring: '@M' , String cr).
	#( '@N()' 'x -> x' '(y) -> y' '(int z) -> z' 'C,' 'D()' ) do: [ :written |
		self assert: (exported includesSubstring: written) ]
]

{ #category : 'tests' }
JavaSmaCCOptionalParenthesesTest >> testOnlyTheBareParameterIsConcise [

	| lambdas |
	lambdas := (fastModel allWithType: FASTJavaLambdaExpression) sorted: [ :a :b | a startPos < b startPos ].
	self assert: (lambdas collect: [ :lambda | lambda hasConciseParameter ]) asArray equals: #( true false false )
]

{ #category : 'tests' }
JavaSmaCCOptionalParenthesesTest >> testOnlyTheConstantWritingThemHasParentheses [

	| constants |
	constants := (fastModel allWithType: FASTJavaEnumConstant) sorted: [ :a :b | a startPos < b startPos ].
	self assert: (constants collect: [ :constant | constant hasParentheses ]) asArray equals: #( false true )
]

{ #category : 'tests' }
JavaSmaCCOptionalParenthesesTest >> testOnlyTheNormalAnnotationHasParentheses [

	| annotations |
	annotations := (fastModel allWithType: FASTJavaAnnotation) sorted: [ :a :b | a startPos < b startPos ].
	self assert: (annotations collect: [ :annotation | annotation hasParentheses ]) asArray equals: #( false true )
]
