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
FASTJavaExportVisitorTest >> testVisitFASTJavaArrayAccess [

	| exprUni exprBi |
	exprUni := builder array: 'testArray' accessAtIndex: 6.
	exprBi := builder array: 'testArray' accessAtFirstDimensionIndex: 4 andSecondDimensionIndex: 2. 
	
	self export: exprUni equals: 'testArray[6]'.
	self export: exprBi equals: 'testArray[4][2]'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaArrayTypeExpression [

	| exprStr exprDouble exprBiStr |
	exprStr := builder stringArrayType.
	exprDouble := builder doubleArrayType.
	exprBiStr := builder stringTwoDimensionalArrayType.
	
	self export: exprStr equals: 'String[]'.
	self export: exprDouble equals: 'double[]'.
	self export: exprBiStr equals: 'String[][]'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaAssignmentExpression [
	| node |
	node := builder assignment: 'aVar' value: (builder literalInt: 42).

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
FASTJavaExportVisitorTest >> testVisitFASTJavaConditionalExpression [

	| expr |
	expr := builder
		        conditionalExpr: (builder var: 'aVar')
		        then: (builder literalInt: 0)
		        else: (builder literalInt: 1).

	self export: expr equals: 'aVar ? 0 : 1'
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
FASTJavaExportVisitorTest >> testVisitFASTJavaUnaryExpression [

	| nodeVar nodeInt |
	nodeVar := builder
		              unaryOp: '!'
		              prefix: true
		              expr: (builder var: 'isPrefix').

	nodeInt := builder
		              unaryOp: '++'
		              prefix: false
		              expr: (builder literalInt: 42).

	self export: nodeVar equals: '!isPrefix'.
	self export: nodeInt equals: '42++'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaVarDeclStatement [

	| stmt |
	stmt := builder var: 's' declaration: 'String'.
	
	self export: stmt equals: 'String s;
'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaVarDeclWith2BlockComments [

	| stmt cmt |
	stmt := builder var: 's' declaration: 'String'.
	cmt := builder comment: '/* this is a var declaration */'.
	cmt  startPos: 0.
	stmt addComment: cmt.
	cmt := builder comment: '/* But it is never used */'.
	cmt  startPos: 50.
	stmt addComment: cmt.

	self export: stmt equals: '/* this is a var declaration */
/* But it is never used */
String s;
'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaVarDeclWithBlockAndLineComments [

	| stmt cmt |
	stmt := builder var: 's' declaration: 'String'.
	cmt := builder comment: '/* this is a var declaration */'.
	cmt  startPos: 0.
	stmt addComment: cmt.
	cmt := builder comment: '// this is the same declaration'.
	cmt  startPos: 50.
	stmt addComment: cmt.

	self export: stmt equals: '/* this is a var declaration */
String s;// this is the same declaration
'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaVarDeclWithBlockComment [

	| stmt |
	stmt := builder var: 's' declaration: 'String'.
	stmt addComment: (builder comment: '/* this is a var declaration */').
	
	self export: stmt equals: '/* this is a var declaration */
String s;
'.

]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaVarDeclWithLineComment [

	| stmt |
	stmt := builder var: 's' declaration: 'String'.
	stmt addComment: (builder comment: '// this is a var declaration').
	
	self export: stmt equals: 'String s;// this is a var declaration
'.

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
