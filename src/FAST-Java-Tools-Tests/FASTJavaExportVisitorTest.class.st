Class {
	#name : #FASTJavaExportVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #'FAST-Java-Tools-Tests-export'
}

{ #category : #running }
FASTJavaExportVisitorTest >> astFor: sourceCode [

	^JavaSmaCCProgramNodeImporterVisitor new
		accept: (JavaParser parse: sourceCode)
			typeDeclarations anyOne
]

{ #category : #running }
FASTJavaExportVisitorTest >> astFor: sourceCode withRule: rule [

	^JavaSmaCCProgramNodeImporterVisitor new
		accept: (JavaParser
			createParserOnStream:  (ReadStream on: sourceCode)
			startingAt: (JavaParser perform: rule))
			parse
]

{ #category : #running }
FASTJavaExportVisitorTest >> blockAST: sourceCode [

	^self astFor: sourceCode withRule: #startingStateForblock_statement


]

{ #category : #running }
FASTJavaExportVisitorTest >> export: aFASTJavaNode equals: aString [
	self
		assert: (FASTJavaExportVisitor new export: aFASTJavaNode)
		equals: aString
]

{ #category : #running }
FASTJavaExportVisitorTest >> expressionAST: sourceCode [

	^self astFor: sourceCode withRule: #startingStateForexpression


]

{ #category : #running }
FASTJavaExportVisitorTest >> methodAST: sourceCode [

	^self astFor: sourceCode withRule: #startingStateForclass_or_interface_body_declaration

]

{ #category : #running }
FASTJavaExportVisitorTest >> setUp [
	super setUp.
	
	builder := FASTJavaTestNodeBuilder new
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTEmptyReturn [

	| ast |
	ast := self methodAST: 'void mth() { return; }'.

	self export: ast statements first equals: 'return ;
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnnotatedMethod [
	
	| expr |
	expr := self methodAST: '@Useless void mth() { }'.

	self export: expr equals: '@Useless
void mth() {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnnotation [

	| anno |
	anno := builder annotation: 'Deprecated'.

	self export: anno equals: '@Deprecated'.
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnnotattionWithArgument [
	
	| expr |
	expr := self methodAST: '@Useless("an argument") void mth() { }'.

	self export: expr equals: '@Useless("an argument")
void mth() {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnonymousClassDeclaration [

	| expr |
	expr := self blockAST: '{ var = new AClass() { }; }'.

	self export: expr statements first equals: 'var = new AClass() {
};
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnonymousClassDeclarationWithMethod [

	| expr |
	expr := self blockAST: '{ var = new AClass() { void m() {} }; }'.

	self export: expr statements first equals: 'var = new AClass() {
  void m() {
  }
};
'
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
FASTJavaExportVisitorTest >> testVisitFASTJavaAttributeAccess [

	| ast |
	ast := self methodAST: 'public void mth() { this.att = 5; }'.

	self export: ast statements first equals: 'this.att = 5;
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaAttributeModifiers [

	| ast |
	ast := self astFor: 'class Blah { private static final int CONST = 42; }'.

	self export: ast equals: 'class Blah {
private static final int CONST = 42;
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaCastExpression [
	| node |
	node := builder cast: 'float' expression: (builder var: 'aVar').
	self export: node equals: '((float) aVar)'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaCastExpressionWithParentheses [

	| expr |
	expr := self expressionAST: '((AClass) obj.m1()).m2()'.

	self export: expr equals: '((AClass) obj.m1()).m2()'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaCharacterLiteral [
	| node |
	node := builder literal: FASTJavaCharacterLiteral value: '#'.
	self export: node equals: '''#'''
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaCharcaterLiteral [
	| node |
	node := builder literal: FASTJavaCharacterLiteral value: $A.
	self export: node equals: '''A'''
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclaration [
	| node |
	node := builder class: 'Blah'.
	self export: node equals: 'class Blah {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclarationWithInterfaces [
	| node |
	node := builder class: 'Blah'.
	node addInterface: (FASTJavaClassTypeExpression new typeName: (builder type: 'IBlah')).
	node addInterface: (FASTJavaClassTypeExpression new typeName: (builder type: 'Iterator')).
	self export: node equals: 'class Blah implements IBlah, Iterator {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclarationWithModifiers [
	| node |
	node := builder class: 'Blah'.
	node addModifier:  (builder modifier: 'public').
	node addModifier:  (builder modifier: 'final').
	self export: node equals: 'public final class Blah {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclarationWithSuperclass [
	| node |
	node := builder class: 'Blah'.
	node superclass: (FASTJavaClassTypeExpression new typeName: (builder type: 'String')).
	self export: node equals: 'class Blah extends String {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclarationWithSuperclassAndInterfaces [
	| node |
	node := builder class: 'Blah'.
	node superclass: (FASTJavaClassTypeExpression new typeName: (builder type: 'String')).
	node addInterface: (FASTJavaClassTypeExpression new typeName: (builder type: 'IBlah')).
	node addInterface: (FASTJavaClassTypeExpression new typeName: (builder type: 'Iterator')).
	self export: node equals: 'class Blah extends String implements IBlah, Iterator {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaConditionalExpression [

	| expr |
	expr := self methodAST: 'public void mth() { a = aVar ? 0 : 1; }'.

	self export: expr statements first equals: 'a = aVar ? 0 : 1;
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaContinueStatement [

	| ast |
	ast := self methodAST: 'public void mth() { continue; }'.

	self export: ast statements first equals: 'continue;
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaEnumDeclaration [

	| ast |
	ast := self astFor: 'enum Blah { A, B; }'.

	self export: ast equals: 'enum Blah {
  A, B;
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaFloatLiteral [
	| node |
	node := builder literal: FASTJavaFloatLiteral value: '37.2'.
	self export: node equals: '37.2f'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaForEachLoop [

	| expr |
	expr := self methodAST: 'public void mth() { for (String s : collection) ; }'.

	self export: expr statements first equals: 'for (String s : collection) 
  ;
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaForLoopBlockStatement [

	| expr |
	expr := self methodAST: 'public void mth() { for (int i=0; i<=10; i++) {
    i = 0;
    j = 0;
  }
}'.

	self export: expr statements first equals: 'for (int i = 0; i<=10; i++) {
    i = 0;
    j = 0;
  }
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaForLoopEmpty [

	| expr |
	expr := self methodAST: 'public void mth() { for (int i=0; i<=10; i++) ; }'.

	self export: expr statements first equals: 'for (int i = 0; i<=10; i++) 
  ;
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaForLoopSingleStatement [

	| expr |
	expr := self methodAST: 'public void mth() { for (int i=0; i<=10; i++)
  i = 0;
}'.

	self export: expr statements first equals: 'for (int i = 0; i<=10; i++) 
  i = 0;
'
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
FASTJavaExportVisitorTest >> testVisitFASTJavaInfixOperationInstanceof [

	| expr |
	expr := self methodAST: 'public void mth() { aBool = obj instanceof AClass; }'.

	self export: expr statements first equals: 'aBool = obj instanceof AClass;
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaIntegerLiteral [
	| node |
	node := builder literal: FASTJavaIntegerLiteral value: '42'.
	self export: node equals: '42'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaInterfaceDeclaration [

	| ast |
	ast := self astFor: 'interface IBlah { }'.

	self export: ast equals: 'interface IBlah {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaInterfaceDeclarationExtendsInterfaces [

	| ast |
	ast := self astFor: 'interface IBlah extends Intfce1, Intfce2 { }'.

	self export: ast equals: 'interface IBlah extends Intfce1, Intfce2 {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaInterfaceDeclarationWithDefaultMethod [

	| ast |
	ast := self astFor: 'interface IBlah { 
  void defaultMth() { return 1; }
}'.

	self export: ast equals: 'interface IBlah {
  void defaultMth() {
    return 1;
  }
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaInterfaceWithAbstractMethod [

	| ast |
	ast := self astFor: 'interface IBlah {
  int mth();
}'.

	self export: ast equals: 'interface IBlah {
  int mth() ;
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaLongLiteral [
	| node |
	node := builder literal: FASTJavaLongLiteral value: '42'.
	self export: node equals: '42L'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodAbstract [

	| ast |
	ast := self methodAST: 'public abstract void mth();'.

	self export: ast equals: 'public abstract void mth() ;
'
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
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodModifiers [

	| ast |
	ast := self methodAST: 'private static final void mth() { }'.

	self export: ast equals: 'private static final void mth() {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaNewArrayIntArg [
	| node |
	node := builder newStringArrayExpression: { builder literalInt: 5 }.
	self export: node equals: 'new String[5]'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaNewArrayNoArg [
	| node |
	node := builder newStringArrayExpression:  {FASTJavaEmptyDimExpression new}.
	self export: node equals: 'new String[]'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaNullLiteral [
	| node |
	node := builder literal: FASTJavaNullLiteral value: nil.
	self export: node equals: 'null'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaOuterThis [
	| ast |
	ast := self methodAST: 'void mth() { return EnclosingClass.this; }'.

	self export: ast statements first equals: 'return EnclosingClass.this;
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaStringConcatenation [

	| ast |
	self skip: 'exporter need #parenthesiseExpressions option for this test'.

	ast := self methodAST: 'void mth() {
  return "next i=" + (i+1) + ".";
}'.

	self export: ast equals: 'void mth() {
  return "next i=" +i+1+".";
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaStringLiteral [
	| node |
	node := builder literal: FASTJavaStringLiteral value: 'This is a String'.
	self export: node equals: '"This is a String"'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaTestOnCharacter [

	| ast |
	ast := self methodAST: 'void mth() { if ( a == ''A'') ; }'.

	self export: ast statements first equals: 'if (a==''A'') 
;
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaTryCatch [

	| ast |
	ast := self methodAST: 'void mth() {
  try { }
  catch (SomeError err) { }
}'.

	self export: ast equals: 'void mth() {
  try {
  }
  catch (SomeError err) {
  }
}
'
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
FASTJavaExportVisitorTest >> testVisitFASTJavaVarDeclArrayWithInitializer [

	| stmt type |
	type := builder newStringArrayExpression:  {FASTJavaEmptyDimExpression new}.
	type initializer: (builder arrayInitializer: { builder literalString: 'a' }).
	stmt := builder
		declarator: 'strArray'
		init: type.
	
	self export: stmt equals: 'strArray = new String[] { "a" }'.

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
FASTJavaExportVisitorTest >> testVisitFASTJavaWhileLoopEmpty [

	| ast |
	ast := self blockAST: '{ while (iter.hasNext()) iter.next(); }'.

	self export: ast statements first equals: 'while (iter.hasNext()) 
  iter.next();
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTSwitchCaseDefault [

	| ast |
	ast := self methodAST: 'void mth() { switch (a) { case b: break; default: break; } }'.

	self export: ast statements first equals: 'switch (a) {
  case b :
    break;
  default:
    break;
}
'
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
