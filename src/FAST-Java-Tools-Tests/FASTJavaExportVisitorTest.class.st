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

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTAssignmentInMessageSend [

	| expr |
	expr := self methodAST: 'void meth() {
  new Timer() {
    public void run() { a = 5; }
  }.schedule(2000);
}'.

	self export: expr equals: 'void meth() {
  new Timer() {
    public void run() {
      a = 5;
    }
}.schedule(2000);
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTEmptyReturn [

	| ast |
	ast := self methodAST: 'void mth() { return; }'.

	self export: ast statements first equals: 'return ;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTEmptyReturnAttributeAccess [

	| ast |

	ast := self methodAST: 'void mth() { return a.b; }'.

	self export: ast statements first equals: 'return a.b;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnnotatedMethod [
	
	| expr |
	expr := self methodAST: '@Useless void mth() { }'.

	self export: expr equals: '@Useless
void mth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnnotatedMethodWithArgument [
	
	| expr |
	expr := self methodAST: '@Useless("anArgument") void mth() { }'.

	self export: expr equals: '@Useless("anArgument")
void mth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnnotationWithArrayElement [
	
	| expr |
	expr := self methodAST: '@Useless( { "anArgument" } ) void mth() { }'.

	self export: expr equals: '@Useless({ "anArgument" })
void mth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnnotationWithArrayElementWithOtherAnnotation [
	
	| expr |
	expr := self methodAST: '@Useless( { @OtherAnnotation } ) void mth() { }'.

	self export: expr equals: '@Useless({ @OtherAnnotation })
void mth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnnotationWithElement [
	
	| expr |
	expr := self methodAST: '@Useless("an argument") void mth() { }'.

	self export: expr equals: '@Useless("an argument")
void mth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnnotationWithElementClassProperty [
	
	| expr |
	expr := self methodAST: '@Useless(AClass.class) void mth() { }'.

	self export: expr equals: '@Useless(AClass.class)
void mth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnnotationWithNamedElements [
	
	| expr |
	expr := self methodAST: '@Useless(arg1="an argument",arg2=AClass.A_Constant) void mth() { }'.

	self export: expr equals: '@Useless(arg1 = "an argument", arg2 = AClass.A_Constant)
void mth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnonymousClassDeclaration [

	| expr |
	expr := self blockAST: '{ var = new AClass() { }; }'.

	self export: expr statements first equals: 'var = new AClass() {
};
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAnonymousClassDeclarationWithMethod [

	| expr |
	expr := self blockAST: '{ var = new AClass() { void m() {} }; }'.

	self export: expr statements first equals: 'var = new AClass() {
  void m() {
  }
};
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaArrayAccess [

	| exprUni exprBi |
	exprUni := builder array: 'testArray' accessAtIndex: 6.
	exprBi := builder array: 'testArray' accessAtFirstDimensionIndex: 4 andSecondDimensionIndex: 2. 
	
	self export: exprUni equals: 'testArray[6]'.
	self export: exprBi equals: 'testArray[4][2]'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaArrayTypeExpression [

	| exprStr exprDouble exprBiStr |
	exprStr := builder stringArrayType.
	exprDouble := builder doubleArrayType.
	exprBiStr := builder stringTwoDimensionalArrayType.
	
	self export: exprStr equals: 'String[]'.
	self export: exprDouble equals: 'double[]'.
	self export: exprBiStr equals: 'String[][]'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAssertStatement [

	| expr |
	expr := self blockAST: '{ assert 1>2 : "assertion did not work"; }'.

	self export: expr statements first equals: 'assert 1>2 : "assertion did not work";
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAssertStatementExplanationIsExpression [

	| expr |
	expr := self blockAST: '{ assert 1>2 : "number " + 1 + " is too big"; }'.

	self export: expr statements first equals: 'assert 1>2 : "number "+1+" is too big";
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAssertStatementNoExplanation [

	| expr |
	expr := self blockAST: '{ assert 1>2; }'.

	self export: expr statements first equals: 'assert 1>2;
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAssignmentExpression [
	| node |
	node := builder assignment: 'aVar' value: (builder literalInt: 42).

	self
		export: node
		equals: 'aVar = 42'.

]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAttributeAccess [

	| ast |
	ast := self methodAST: 'public void mth() { this.att = 5; }'.

	self export: ast statements first equals: 'this.att = 5;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaAttributeModifiers [

	| ast |
	ast := self astFor: 'class Blah { private static final int CONST = 42; }'.

	self export: ast equals: 'class Blah {
  private static final int CONST = 42;
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaCastExpression [
	| node |
	node := builder cast: 'float' expression: (builder var: 'aVar').
	self export: node equals: '(float) aVar'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaCastExpressionWithParentheses [

	| expr |
	expr := self expressionAST: '((AClass) obj.m1()).m2()'.

	self export: expr equals: '((AClass) obj.m1()).m2()'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaCharacterLiterals [

	self export: (self expressionAST: '''a''') equals: '''a'''.
	self export: (self expressionAST: '''\n''') equals: '''\n'''.
	self export: (self expressionAST: '''\uABCD''') equals: '''\uABCD'''.
	self export: (self expressionAST: '''\000''') equals: '''\000'''
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclaration [
	| node |
	node := builder class: 'Blah'.
	self export: node equals: 'class Blah {
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclarationWithAnnotatedMethod [
	| node |
	node := builder class: 'Blah'.
	node addDeclaration: (self methodAST: '@Test void mth() { }').
	self export: node equals: 'class Blah {
  @Test
  void mth() {
  }
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclarationWithAnnotation [
	| node |
	node := builder class: 'Blah'.
	node addModifier: (builder annotation: 'Test').
	self export: node equals: '@Test
class Blah {
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclarationWithInterfaces [
	| node |
	node := builder class: 'Blah'.
	node addInterface: (FASTJavaClassTypeExpression new typeName: (builder type: 'IBlah')).
	node addInterface: (FASTJavaClassTypeExpression new typeName: (builder type: 'Iterator')).
	self export: node equals: 'class Blah implements IBlah, Iterator {
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclarationWithMethod [
	| node |
	node := builder class: 'Blah'.
	node addDeclaration: (self methodAST: 'void mth() { }').
	self export: node equals: 'class Blah {
  void mth() {
  }
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclarationWithModifiers [
	| node |
	node := builder class: 'Blah'.
	node addModifier:  (builder modifier: 'public').
	node addModifier:  (builder modifier: 'final').
	self export: node equals: 'public final class Blah {
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaClassDeclarationWithSuperclass [
	| node |
	node := builder class: 'Blah'.
	node superclass: (FASTJavaClassTypeExpression new typeName: (builder type: 'String')).
	self export: node equals: 'class Blah extends String {
}
'
]

{ #category : #'test from FAST model' }
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

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaConditionalExpression [

	| expr |
	expr := self methodAST: 'public void mth() { a = aVar ? 0 : 1; }'.

	self export: expr statements first equals: 'a = aVar ? 0 : 1;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaContinueStatement [

	| ast |
	ast := self methodAST: 'public void mth() { continue; }'.

	self export: ast statements first equals: 'continue;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaDoWhile [

	| ast |
	ast := self methodAST: 'void mth() { do { } while (1==1); }'.

	self export: ast equals: 'void mth() {
  do {
  }
  while (1==1);
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaEnumDeclaration [

	| ast |
	ast := self astFor: 'class Blah {
	   void method() { }
	}'.

	self export: ast equals: 'class Blah {
  void method() {
  }
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaEnumDeclarationWithInitializedField [

	| ast |
	ast := self astFor: 'enum AnEnum {
  CONST1, CONST2;
  AnEnum aField = CONST1;
}'.

	self export: ast equals: 'enum AnEnum {
  CONST1, CONST2;
  AnEnum aField = CONST1;
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesCastAndArithmeticSubExpression [
	
	| expr |
	expr := self expressionAST: '(int)(3*4)'.

	self export: expr equals: '(int) (3*4)'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesCastAndAttributeAccess [
	
	| expr |
	expr := self expressionAST: '((String)1).attr'.

	self export: expr equals: '((String) 1).attr'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesClearStackOnTopLevelExpression [
	"topLevelExpression
	 Introduced to deal with an expression as argument of a method call because we are using a global stack,
	 it does not see the difference with a message send on a sub-expression"
	
	| expr |
	expr := self expressionAST: 'meth("a"+"b")'.

	self export: expr equals: 'meth("a"+"b")'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesMessageOnStringConcatenation [
	
	| expr |
	expr := self expressionAST: '("a"+"b").length()'.

	self export: expr equals: '("a"+"b").length()'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesNone [
	
	| expr |
	expr := self expressionAST: '(4+5)'.

	self export: expr equals: '4+5'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesStringConcatenationLeft [
	
	| expr |
	expr := self methodAST: 'void mth() { a="string"+(b+1); }'.

	self export: expr statements first equals: 'a = "string"+(b+1);
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesStringConcatenationRight [
	
	| expr |
	expr := self methodAST: 'void mth() { a=(b+1)+"string"; }'.

	self export: expr statements first equals: 'a = (b+1)+"string";
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesStringConcatenationTypeInference [
	"A case of string concatenation where the string is the result of another expression (not a Literal)
	 In the example, the first concatenation ('a+String') returns a string 
	 that must be concatenated with the arithmetic operation"
	
	| expr |
	expr := self methodAST: 'void mth() { a=b+"string"+(c+1); }'.

	self export: expr statements first equals: 'a = b+"string"+(c+1);
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesSubHasHigherPrecedence [
	
	| expr |
	expr := self expressionAST: '(4/5)-6'.

	self export: expr equals: '4/5-6'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesSubHasLowerPrecedence [
	
	| expr |
	expr := self expressionAST: '(4+5)*6'.

	self export: expr equals: '(4+5)*6'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesSubUnary [
	
	| expr |
	expr := self methodAST: 'void mth() { a = 2*(x++); }'.

	self export: expr statements first equals: 'a = 2*x++;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesTernaryIsSubWithHigherPrecedence [
	
	| expr |
	expr := self methodAST: 'void mth() { a = (5>6 ? 7 : 8); }'.

	self export: expr statements first equals: 'a = 5>6 ? 7 : 8;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesTernaryIsSubWithLowerPrecedence [
	
	| expr |
	expr := self expressionAST: '4 + (5>6 ? 7 : 8)'.

	self export: expr equals: '4+(5>6 ? 7 : 8)'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesTernarySubHasHigherPrecedence [
	
	| expr |
	expr := self expressionAST: '4>=5 ? 6<<7 : 8%9'.

	self export: expr equals: '4>=5 ? 6<<7 : 8%9'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesTernarySubHasLowerPrecedence1 [
	
	| expr |
	expr := self methodAST: 'void mth() { a = ((b=4) ? 5 : 6) ; }'.

	self export: expr statements first equals: 'a = (b = 4) ? 5 : 6;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesTernarySubHasLowerPrecedence2 [
	"parentheses not needed between '?' and ':'"
	
	| expr |
	expr := self methodAST: 'void mth() { a = (4>=5 ? b+=3 : b-=3) ; }'.

	self export: expr statements first equals: 'a = 4>=5 ? b += 3 : (b -= 3);
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaExpressionParenthesesUnaryWithSub [
	
	| expr |
	expr := self methodAST: 'void mth() { a = (2*x)++; }'.

	self export: expr statements first equals: 'a = (2*x)++;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaFieldAccessOnSuper [
	
	| expr |
	expr := self methodAST: 'void mth() { super.aField = 5; }'.

	self export: expr equals: 'void mth() {
  super.aField = 5;
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaFieldAccessOnThis [
	
	| expr |
	expr := self methodAST: 'void mth() { this.aField = 5; }'.

	self export: expr equals: 'void mth() {
  this.aField = 5;
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaFloatLiteral [
	| node |
	node := builder literal: FASTJavaFloatLiteral value: '37.2f'.
	self export: node equals: '37.2f'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaForEachLoop [

	| expr |
	expr := self methodAST: 'public void mth() { for (String s : collection) ; }'.

	self export: expr statements first equals: 'for (String s : collection) 
  ;
'
]

{ #category : #'test from source code' }
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

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaForLoopEmpty [

	| expr |
	expr := self methodAST: 'public void mth() { for (int i=0; i<=10; i++) ; }'.

	self export: expr statements first equals: 'for (int i = 0; i<=10; i++) 
  ;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaForLoopMissingElements [

	| expr |
	expr := self methodAST: 'public void mth() { for (; ;) ; }'.

	self export: expr statements first equals: 'for (;;) 
  ;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaForLoopSingleStatement [

	| expr |
	expr := self methodAST: 'public void mth() { for (int i=0; i<=10; i++)
  i = 0;
}'.

	self export: expr statements first equals: 'for (int i = 0; i<=10; i++) 
  i = 0;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaFullyQualifiedName [

	| ast |
	ast := self methodAST: 'java.lang.String method() { }'.

	self export: ast equals: 'java.lang.String method() {
}
'
]

{ #category : #'test from FAST model' }
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

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaInfixOperationInstanceof [

	| expr |
	expr := self methodAST: 'public void mth() { aBool = obj instanceof AClass; }'.

	self export: expr statements first equals: 'aBool = obj instanceof AClass;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaInitializer [

	| ast |
	ast := self astFor: 'class C { { } }'.

	self export: ast equals: 'class C {
  {
  }
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaInitializerStatic [

	| ast |
	ast := self astFor: 'class C { static { } }'.

	self export: ast equals: 'class C {
  static {
  }
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaIntegerLiteral [
	| node |
	node := builder literal: FASTJavaIntegerLiteral value: '42'.
	self export: node equals: '42'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaInterfaceDeclaration [

	| ast |
	ast := self astFor: 'interface IBlah { }'.

	self export: ast equals: 'interface IBlah {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaInterfaceDeclarationExtendsInterfaces [

	| ast |
	ast := self astFor: 'interface IBlah extends Intfce1, Intfce2 { }'.

	self export: ast equals: 'interface IBlah extends Intfce1, Intfce2 {
}
'
]

{ #category : #'test from source code' }
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

{ #category : #'test from source code' }
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

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaLabeledReturnStatement [

	| ast |
	ast := self methodAST: 'void meth() { label: return; }'.

	self export: ast equals: 'void meth() {
  label:  return ;
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaLabeledStatementBlock [

	| ast |
	ast := self methodAST: 'void meth() { label: { } }'.

	self export: ast equals: 'void meth() {
  label:{
  }
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaLambdaExpressionOneStatement [

	| ast |
	ast := self methodAST: 'void mth() { a = ( arg -> doSomething() ); }'.

	self export: ast equals: 'void mth() {
  a = (arg) -> doSomething();
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaLambdaExpressionStatementBlock [

	| ast |
	ast := self methodAST: 'void mth() { a = ( (arg1,arg2) -> { doSomething(); doOtherThing(); }); }'.

	self export: ast equals: 'void mth() {
  a = (arg1, arg2) -> {
    doSomething();
    doOtherThing();
  }
;
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaLongLiteral [

	| node |
	self skip: 'FASTJavaLongLiteral are never created by the importer'.

	node := builder literal: FASTJavaLongLiteral value: '42L'.
	self export: node equals: '42L'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodAbstract [

	| ast |
	ast := self methodAST: 'public abstract void mth();'.

	self export: ast equals: 'public abstract void mth() ;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodDeclaration [

	| ast |
	ast := self methodAST: 'public String mth() { }'.

	self export: ast equals: 'public String mth() {
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodInvocation [

	| node |
	node := builder invocation: 'methodA' recvr: nil args: #(  ).
	self export: node equals: 'methodA()'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodInvocationArguments [

	| node |
	node := builder invocation: 'methodA' recvr: nil args: { 
			        (builder var: 'aVar').
			        (builder literalInt: 42) }.

	self export: node equals: 'methodA(aVar, 42)'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodInvocationReceiver [
	| node |
	node := FASTJavaMethodInvocation new name: 'methodA'.
	node receiver: (FASTJavaVariableExpression new name: 'aVar').
	self
		export: node
		equals: 'aVar.methodA()'.

]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodInvocationReceiverIsAssignmentExpression [

	| ast |
	ast := self expressionAST: '(x = "a"+"b").length()'.

	self export: ast equals: '(x = "a"+"b").length()'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaMethodModifiers [

	| ast |
	ast := self methodAST: 'private static final void mth() { }'.

	self export: ast equals: 'private static final void mth() {
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaNewArrayIntArg [
	| node |
	node := builder newStringArrayExpression: { builder literalInt: 5 }.
	self export: node equals: 'new String[5]'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaNewArrayNoArg [
	| node |
	node := builder newStringArrayExpression:  {FASTJavaEmptyDimExpression new}.
	self export: node equals: 'new String[]'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaNullLiteral [
	| node |
	node := builder literal: FASTJavaNullLiteral value: nil.
	self export: node equals: 'null'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaOuterThis [
	| ast |
	ast := self methodAST: 'void mth() { return EnclosingClass.this; }'.

	self export: ast statements first equals: 'return EnclosingClass.this;
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaParameter [

	| ast |
	ast := self methodAST: 'void mth(String first, int... etc) {}'.
	self export: ast equals: 'void mth(String first, int... etc) {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaPostIncrementAndSum [

	| expr |
	expr := self methodAST: 'void meth() { a = a++ + 12; }'.

	self export: expr statements first equals: 'a = a++ +12;
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaPrefixedUnaryExpression [
	"testing for operator precedence of operator '!'"
	| ast |
	ast := self methodAST: 'void mth() { boolean toto = false|!true; }'.
	self
		export:
		ast statements first declarators first expression rightOperand
		equals: ' !true'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaStringLiteral [
	| node |
	node := builder literal: FASTJavaStringLiteral value: 'This is a String'.
	self export: node equals: '"This is a String"'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaSumAndPreIncrement [

	| expr |
	expr := self methodAST: 'void meth() { a = 12 + ++a; }'.

	self export: expr statements first equals: 'a = 12+ ++a;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaSynchronizedBlock [

	| expr |
	expr := self methodAST: 'void meth() { synchronized(var) { } }'.

	self export: expr statements first equals: 'synchronized(var) {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTestOnCharacter [

	| ast |
	ast := self methodAST: 'void mth() { if ( a == ''A'') ; }'.

	self export: ast statements first equals: 'if (a==''A'') 
;
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaThrowStatement [

	| expr |
	expr := self methodAST: 'void mth() { throw new Exception(); }'.

	self export: expr statements first equals: 'throw new Exception();
'
]

{ #category : #'test from source code' }
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

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTryCatchMultipleExceptinoClasses [

	| ast |
	ast := self methodAST: 'void mth() {
  try { }
  catch (SomeError | OtherError err) { }
}'.

	self export: ast equals: 'void mth() {
  try {
  }
  catch (SomeError | OtherError err) {
  }
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTryFinally [

	| ast |
	ast := self methodAST: 'void mth() {
  try { }
  finally { }
}'.

	self export: ast equals: 'void mth() {
  try {
  }
  finally {
  }
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTryWithMultipleResources [

	| ast |
	ast := self methodAST: 'void mth() {
  try  (ACloseableType o = new ACloseableType(); OtherCloseable p = makeOtherCloseable()) { }
}'.

	self export: ast equals: 'void mth() {
  try (ACloseableType o = new ACloseableType(); OtherCloseable p = makeOtherCloseable()) {
  }
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTryWithResource [

	| ast |
	ast := self methodAST: 'void mth() {
  try  (ACloseableType o = new ACloseableType()) { }
}'.

	self export: ast equals: 'void mth() {
  try (ACloseableType o = new ACloseableType()) {
  }
}
'
]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTypeName [

	self
		export: (builder type: 'bool')
		equals: 'bool'.

]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTypeParameterGenericMethod [
	
	| expr |
	expr := self methodAST: 'public <K,V> IMap<K,V> meth() { }'.

	self export: expr equals: 'public <K, V> IMap<K, V> meth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTypeParameterOnMethod [
	
	| expr |
	expr := self methodAST: 'IMap<String,Integer> meth() { }'.

	self export: expr equals: 'IMap<String, Integer> meth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTypeParameterWildCard [
	
	| expr |
	expr := self methodAST: 'public Collection<?> meth() {}'.

	self export: expr equals: 'public Collection<?> meth() {
}
'
]

{ #category : #tests }
FASTJavaExportVisitorTest >> testVisitFASTJavaTypeParameterWithMultipleTypes [

	| expr |
	expr := self methodAST: '<T extends MyClass & Iterable> T mth() { }'.

	self export: expr equals: '<T extends MyClass & Iterable> T mth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTypeParameterWithParametersExtendingSomeType [
	
	| expr |
	expr := self methodAST: '<X extends Object> X meth() { }'.

	self export: expr equals: '<X extends Object> X meth() {
}
'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaTypeParameterWithParametersOnMethod [
	
	| expr |
	expr := self methodAST: 'IMap<String,Iterator<String>> meth() { }'.

	self export: expr equals: 'IMap<String, Iterator<String>> meth() {
}
'
]

{ #category : #'test from FAST model' }
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

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaVarDeclArrayWithInitializer [

	| stmt type |
	type := builder newStringArrayExpression:  {FASTJavaEmptyDimExpression new}.
	type initializer: (builder arrayInitializer: { builder literalString: 'a' }).
	stmt := builder
		declarator: 'strArray'
		init: type.
	
	self export: stmt equals: 'strArray = new String[] { "a" }'.

]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaVarDeclStatement [

	| stmt |
	stmt := builder var: 's' declaration: 'String'.
	
	self export: stmt equals: 'String s;
'.

]

{ #category : #'test from FAST model' }
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

{ #category : #'test from FAST model' }
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

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaVarDeclWithBlockComment [

	| stmt |
	stmt := builder var: 's' declaration: 'String'.
	stmt addComment: (builder comment: '/* this is a var declaration */').
	
	self export: stmt equals: '/* this is a var declaration */
String s;
'.

]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaVarDeclWithLineComment [

	| stmt |
	stmt := builder var: 's' declaration: 'String'.
	stmt addComment: (builder comment: '// this is a var declaration').
	
	self export: stmt equals: 'String s;// this is a var declaration
'.

]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTJavaVariableExpression [
	self
		export: (builder var: 'aVar')
		equals: 'aVar'
]

{ #category : #'test from source code' }
FASTJavaExportVisitorTest >> testVisitFASTJavaWhileLoopEmpty [

	| ast |
	ast := self blockAST: '{ while (iter.hasNext()) iter.next(); }'.

	self export: ast statements first equals: 'while (iter.hasNext()) 
  iter.next();
'
]

{ #category : #'test from source code' }
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

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTTExpressionStatement [
	| node |
	node := builder exprStatement: (builder invocation: 'methodA' recvr: nil args: #()).
	self
		export: node
		equals: 'methodA();
'.

]

{ #category : #'test from FAST model' }
FASTJavaExportVisitorTest >> testVisitFASTTLiterals [
	self
		export: (builder literalNull)
		equals: 'null'.
	self
		export: (builder literalInt: 42)
		equals: '42'.
	self
		export: (builder literalFloat: '42f')
		equals: '42f'.
	self
		export: (builder literalString: 'a string')
		equals: '"a string"'.

]
