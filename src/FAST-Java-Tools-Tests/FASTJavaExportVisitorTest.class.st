Class {
	#name : #FASTJavaExportVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #'FAST-Java-Tools-Tests-export'
}

{ #category : #running }
FASTJavaExportVisitorTest >> export: aFASTJavaNode equals: aString [
	self
		assert: (FASTJavaExportVisitor new export: aFASTJavaNode)
		equals: aString
]

{ #category : #running }
FASTJavaExportVisitorTest >> setUp [
	super setUp.
	
	builder := FASTJavaTestNodeBuilder new
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaAssignementExpression [
	| node |
	node := builder assignement: 'aVar' value: (builder literalInt: 42).

	self
		export: node
		equals: 'aVar = 42'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaCastExpression [
	| node |
	node := builder cast: 'float' expression: (builder var: 'aVar').
	self export: node equals: '(float)aVar'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaInfixOperation [
	| node |
	node := builder
		infix: '==' 
		lhs: (builder var: 'aVar')
		rhs: (builder literalInt: 42).

	self
		export: node
		equals: 'aVar==42'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodInvocation [

	| node |
	node := builder invocation: 'methodA' recvr: nil args: #(  ).
	self export: node equals: 'methodA()'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodInvocationArguments [

	| node |
	node := builder invocation: 'methodA' recvr: nil args: { 
			        (builder var: 'aVar').
			        (builder literalInt: 42) }.

	self export: node equals: 'methodA(aVar, 42)'
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
FASTJavaExportVisitorTest >> testVisitFASTJavaTypeName [

	self
		export: (builder type: 'bool')
		equals: 'bool'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaVariableExpression [
	self
		export: (builder var: 'aVar')
		equals: 'aVar'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTTExpressionStatement [
	| node |
	node := builder exprStatement: (builder invocation: 'methodA' recvr: nil args: #()).
	self
		export: node
		equals: 'methodA();
'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTTLiteral [
	self
		export: (builder literalNull)
		equals: 'null'.
	self
		export: (builder literalInt: 42)
		equals: '42'.
	self
		export: (builder literalString: 'a string')
		equals: '"a string"'.

]
