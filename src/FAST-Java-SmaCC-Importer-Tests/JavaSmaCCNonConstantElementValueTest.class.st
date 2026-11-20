"
JLS 9.7.1 writes an element value as a conditional expression, so javac's parser reads any expression there, and its compiler refuses all but a constant expression, a class literal, an enum constant, an annotation and an array of element values. The import refuses the others by that rule, wherever an element value is written.
"
Class {
	#name : 'JavaSmaCCNonConstantElementValueTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'asserting' }
JavaSmaCCNonConstantElementValueTest >> assertRefused: aString [

	self
		should: [ self parseClassString: aString ]
		raise: Error
		withExceptionDo: [ :error | self assert: (error messageText includesSubstring: 'JLS 9.7.1') ]
]

{ #category : 'tests' }
JavaSmaCCNonConstantElementValueTest >> testAConstantExpressionIsAnElementValue [

	| pairs |
	pairs := (self parseClassString: '@A(v = -C.K) class C { }') allWithType: FASTJavaElementValuePair.
	self assert: pairs anyOne value class equals: FASTJavaUnaryExpression
]

{ #category : 'tests' }
JavaSmaCCNonConstantElementValueTest >> testADefaultValueIsAnElementValue [

	self assertRefused: '@interface A { int v() default a[0]; }'
]

{ #category : 'tests' }
JavaSmaCCNonConstantElementValueTest >> testAPairGivesAnElementValue [

	self assertRefused: '@A(v = m()) class C { }'
]

{ #category : 'tests' }
JavaSmaCCNonConstantElementValueTest >> testASingleElementIsAnElementValue [

	self assertRefused: '@A(this) class C { }'
]

{ #category : 'tests' }
JavaSmaCCNonConstantElementValueTest >> testAnArrayOfElementValuesHoldsElementValues [

	self assertRefused: '@A({ new B() }) class C { }'
]
