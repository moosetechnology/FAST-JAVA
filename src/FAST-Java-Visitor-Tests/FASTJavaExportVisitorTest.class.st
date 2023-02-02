Class {
	#name : #FASTJavaExportVisitorTest,
	#superclass : #TestCase,
	#category : #'FAST-Java-Visitor-Tests-export'
}

{ #category : #running }
FASTJavaExportVisitorTest >> export: aFASTJavaNode equals: aString [
	self assert: (FASTJavaExportVisitor new export: aFASTJavaNode) equals: aString
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaAssignementExpression [
	| node |
	node := FASTJavaAssignementExpression new.
	node variable: (FASTJavaVariableExpression new name: 'aVar').
	node expression: (FASTJavaIntegerLiteral new primitiveValue: '42').

	self
		export: node
		equals: 'aVar = 42'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaCastExpression [
	| node |
	node := FASTJavaCastExpression new.
	node type: (FASTJavaClassTypeExpression new typeName: (FASTJavaTypeName new name: 'float')).
	node expression: (FASTJavaVariableExpression new name: 'aVar').
	self
		export: node
		equals: '(float)aVar'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaInfixOperation [
	| node |
	node := FASTJavaInfixOperation new operator: '=='.
	node leftOperand: (FASTJavaVariableExpression new name: 'aVar').
	node rightOperand: (FASTJavaIntegerLiteral new primitiveValue: '42').

	self
		export: node
		equals: 'aVar==42'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodInvocation [
	| node |
	node := FASTJavaMethodInvocation new name: 'methodA'.
	self
		export: node
		equals: 'methodA()'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodInvocationArguments [
	| node |
	node := FASTJavaMethodInvocation new name: 'methodA'.
	node addArgument: (FASTJavaVariableExpression new name: 'aVar').
	node addArgument: (FASTJavaIntegerLiteral new primitiveValue: '42').

	self
		export: node
		equals: 'methodA(aVar, 42)'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodInvocationReceiver [
	| node |
	node := FASTJavaMethodInvocation new name: 'methodA'.
	node receiver: (FASTJavaVariableExpression new name: 'aVar').
	self
		export: node
		equals: 'aVar.methodA()'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaStringLiteral [
	self
		export: (FASTJavaStringLiteral new primitiveValue: 'a string')
		equals: '"a string"'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaTypeName [

	self
		export: (FASTJavaTypeName new name: 'bool')
		equals: 'bool'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaVariableExpression [
	self
		export: (FASTJavaVariableExpression new name: 'aVar')
		equals: 'aVar'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTTExpressionStatement [
	| node |
	node := FASTJavaExpressionStatement new.
	node expression: (FASTJavaMethodInvocation new name: 'methodA').
	self
		export: node
		equals: 'methodA();
'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTTLiteral [
	self
		export: (FASTJavaNullLiteral new primitiveValue: 'null')
		equals: 'null'.
	self
		export: (FASTJavaIntegerLiteral new primitiveValue: '42')
		equals: '42'.
	self
		export: (FASTJavaStringLiteral new primitiveValue: 'a string')
		equals: '"a string"'.

]
