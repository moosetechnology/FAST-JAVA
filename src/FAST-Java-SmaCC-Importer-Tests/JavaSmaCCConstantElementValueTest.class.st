"
I check that the value of an annotation element may be any constant expression (JLS 9.7.1 and 15.29), including one written with a unary operator, a cast or a conditional. `@A(values = {-1})` made the import fail, because an element value array did not accept a unary expression.
"
Class {
	#name : 'JavaSmaCCConstantElementValueTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCConstantElementValueTest >> javaClass [

	^ '@A(values = { -1 }, masks = { ~0 }, sizes = { (int) 2L }, modes = { true ? 1 : 2 })
@interface I {
	int x() default -1;
}'
]

{ #category : 'tests' }
JavaSmaCCConstantElementValueTest >> testAConstantExpressionMayBeAnElementValue [

	self assert: (fastModel allWithType: FASTJavaUnaryExpression) size equals: 3.
	self assert: (fastModel allWithType: FASTJavaCastExpression) size equals: 1.
	self assert: (fastModel allWithType: FASTJavaConditionalExpression) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCConstantElementValueTest >> testEveryElementValueIsExportedAsWritten [

	| exported |
	exported := FASTJavaExportVisitor new export: (fastModel allWithType: FASTJavaCompilationUnit) anyOne.
	#( '{ -1 }' '{ ~0 }' '{ (int) 2L }' '{ true ? 1 : 2 }' 'default -1' ) do: [ :written |
		self assert: (exported includesSubstring: written) description: written ]
]
