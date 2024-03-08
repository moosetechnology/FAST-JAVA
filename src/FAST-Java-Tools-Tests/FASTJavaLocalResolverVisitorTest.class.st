Class {
	#name : #FASTJavaLocalResolverVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'localResolver',
		'builder'
	],
	#category : #'FAST-Java-Tools-Tests-resolver'
}

{ #category : #running }
FASTJavaLocalResolverVisitorTest >> setUp [
	super setUp.
	
	builder := FASTJavaTestNodeBuilder new.
	localResolver := FASTJavaLocalResolverVisitor new
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testBindToDeclaration [
	"
	void meth() {
		int x;
		x = 5;
	}
	"

	| varAccess body ast |

	ast := FASTJavaMethodEntity new
		type: (FASTJavaVoidTypeExpression new name: 'void');
		name: 'meth';
		statementBlock: (FASTJavaStatementBlock new
			 statements: {
					 (FASTJavaVarDeclStatement new
						  type: (FASTJavaIntTypeExpression new name: 'int');
						  declarators: { FASTJavaVariableDeclarator new
								   variable: (FASTJavaVariableExpression new name: 'x') } ;
						  startPos: 1).
					 (FASTJavaExpressionStatement new
						  expression: (FASTJavaAssignmentExpression new
								   variable: (FASTJavaVariableExpression new name: 'x');
								   expression: (FASTJavaIntegerLiteral new primitiveValue: '5') ;
								   operator: '=');
						  startPos: 2) }).

	localResolver on: ast.

	body := ast statementBlock statements.
	varAccess := body second expression variable.
	self deny: varAccess localDeclaration isNonLocalDeclaration.
	self assert: varAccess localDeclaration variable name equals: 'x'.
	self assert: varAccess localDeclaration equals: body first declarators first.

	self assert: body first declarators first localUses size equals: 1
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testBindToLoopVariable [
	"
	void meth() {
		for (int i=1; i<2; i++)
			i--;
	}
	"

	| varAccess loop ast |

	ast := FASTJavaMethodEntity new
		type: (FASTJavaVoidTypeExpression new name: 'void');
		name: 'meth' ;
		statementBlock: (FASTJavaStatementBlock new
			 statements: {
					 (FASTJavaForStatement new
					  initializer: (FASTJavaVarDeclStatement new
							   type: (FASTJavaIntTypeExpression new
									    name: 'int');
							   declarators: { (FASTJavaVariableDeclarator new
									    variable: (FASTJavaVariableExpression new
											     name: 'i');
									    expression: (FASTJavaIntegerLiteral new
											     primitiveValue: '1')) });
					  condition: (FASTJavaInfixOperation new
							   leftOperand: (FASTJavaVariableExpression new name: 'i');
							   rightOperand: (FASTJavaIntegerLiteral new primitiveValue: '2');
							   operator: '<');
					  incrementor: (FASTJavaExpressionStatement new
							   expression: (FASTJavaUnaryExpression new
									    expression: (FASTJavaVariableExpression new name: 'i');
									    operator: '++'));
					  body: (FASTJavaExpressionStatement new
							   expression: (FASTJavaUnaryExpression new
									    expression: (FASTJavaVariableExpression new name: 'i');
									    operator: '--'));
					  startPos: 1) }).

	localResolver on: ast.

	loop := ast statementBlock statements first.
	varAccess := loop condition leftOperand.
	self deny: varAccess localDeclaration isNonLocalDeclaration.
	self assert: varAccess localDeclaration variable name equals: 'i'.
	self assert: varAccess localDeclaration equals: loop initializer declarators first.
	varAccess := loop incrementor expression expression.
	self deny: varAccess localDeclaration isNonLocalDeclaration.
	self assert: varAccess localDeclaration variable name equals: 'i'.
	self assert: varAccess localDeclaration equals: loop initializer declarators first.

	varAccess := loop body expression expression.
	self deny: varAccess localDeclaration isNonLocalDeclaration.
	self assert: varAccess localDeclaration variable name equals: 'i'.
	self assert: varAccess localDeclaration equals: loop initializer declarators first.

	self assert: loop initializer declarators first localUses size equals: 3
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testBindToParameter [
	"
	void meth(int x) {
		x = 5;
	}
	"

	| varAccess body ast |

	ast := FASTJavaMethodEntity new
		type: (FASTJavaVoidTypeExpression new name: 'void');
		name: 'meth';
		parameters: { (FASTJavaParameter new
			 variable: (FASTJavaVariableExpression new name: 'x');
			 type: (FASTJavaIntTypeExpression new name: 'int')) };
		statementBlock: (FASTJavaStatementBlock new
			 statements: {
					 (FASTJavaExpressionStatement new
						  expression: (FASTJavaAssignmentExpression new
								   variable: (FASTJavaVariableExpression new name: 'x');
								   expression: (FASTJavaIntegerLiteral new primitiveValue: '5') ;
								   operator: '=');
						  startPos: 2) }).

	localResolver on: ast.

	body := ast statementBlock statements.
	varAccess := body first expression variable.
	self deny: varAccess localDeclaration isNonLocalDeclaration.
	self assert: varAccess localDeclaration variable name equals: 'x'.
	self assert: varAccess localDeclaration equals: ast parameters first
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testBindingNotFound [
	"
	void meth() {
		x = 5;
	}
	"

	| varAccess body ast |

	ast := FASTJavaMethodEntity new
		type: (FASTJavaVoidTypeExpression new name: 'void');
		name: 'meth';
		statementBlock: (FASTJavaStatementBlock new
			 statements: {
					 (FASTJavaExpressionStatement new
						  expression: (FASTJavaAssignmentExpression new
								   variable: (FASTJavaVariableExpression new name: 'x');
								   expression: (FASTJavaIntegerLiteral new primitiveValue: '5') ;
								   operator: '=');
						  startPos: 2) }).

	localResolver on: ast.

	body := ast statementBlock statements.
	varAccess := body first expression variable.
	self assert: varAccess localDeclaration isNonLocalDeclaration.
	self assert: varAccess localDeclaration name equals: 'x'.
]

{ #category : #tests }
FASTJavaLocalResolverVisitorTest >> testLoopVariableHidesParameter [
	"
	void meth(int i) {
		for (int i=1; ;)
			i++;
	}
	"

	| varAccess loop ast |

	ast := FASTJavaMethodEntity new
		type: (FASTJavaVoidTypeExpression new name: 'void');
		name: 'meth' ;
		parameters: { (FASTJavaParameter new
			 variable: (FASTJavaVariableExpression new name: 'i');
			 type: (FASTJavaIntTypeExpression new name: 'int')) };
		statementBlock: (FASTJavaStatementBlock new
			 statements: {
					 (FASTJavaForStatement new
					  initializer: (FASTJavaVarDeclStatement new
							   type: (FASTJavaIntTypeExpression new
									    name: 'int');
							   declarators: { (FASTJavaVariableDeclarator new
									    variable: (FASTJavaVariableExpression new
											     name: 'i');
									    expression: (FASTJavaIntegerLiteral new
											     primitiveValue: '1')) });
					  body: (FASTJavaExpressionStatement new
							   expression: (FASTJavaUnaryExpression new
									    expression: (FASTJavaVariableExpression new name: 'i');
									    operator: '++'));
					  startPos: 1) }).

	localResolver on: ast.

	loop := ast statementBlock statements first.
	varAccess := loop body expression expression.
	self deny: varAccess localDeclaration isNonLocalDeclaration.
	self assert: varAccess localDeclaration variable name equals: 'i'.
	self assert: varAccess localDeclaration equals: loop initializer declarators first.

	self assert: loop initializer declarators first localUses size equals: 1.
	self assert: ast parameters first localUses size equals: 0
]
