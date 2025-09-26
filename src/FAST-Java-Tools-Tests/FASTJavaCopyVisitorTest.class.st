"
A FASTJavaCopyVisitorTest is a test class for testing the behavior of FASTJavaCopyVisitor
"
Class {
	#name : 'FASTJavaCopyVisitorTest',
	#superclass : 'TestCase',
	#category : 'FAST-Java-Tools-Tests',
	#package : 'FAST-Java-Tools-Tests'
}

{ #category : 'tests' }
FASTJavaCopyVisitorTest >> testVoidMethodWithVarShouldBeEquals [
	"
	void meth() {
		int x;
		x = 5;
	}
	"

	| ast copy children inExpressionEntities |
	ast := FASTJavaMethodEntity new
		       type: (FASTJavaVoidTypeExpression new name: 'void');
		       name: 'meth';
		       statementBlock: (FASTJavaStatementBlock new statements: {
						        (FASTJavaVarDeclStatement new
							         type: (FASTJavaIntTypeExpression new name: 'int');
							         declarators:
								         { (FASTJavaVariableDeclarator new variable:
										          (FASTJavaVariableExpression new name: 'x')) };
							         startPos: 1).
						        (FASTJavaExpressionStatement new
							         expression: (FASTJavaAssignmentExpression new
									          variable:
										          (FASTJavaVariableExpression new name: 'x');
									          expression:
										          (FASTJavaIntegerLiteral new primitiveValue: '5');
									          operator: '=');
							         startPos: 2) }).


	copy := FASTJavaCopyVisitor new copy: ast.
	self assert: copy class equals: FASTJavaMethodEntity.
	children := copy children asOrderedCollection.
	self assert: children size equals: 2.

	self assert:
		(children anySatisfy: [ :c | c class = FASTJavaStatementBlock ]).

	self assert:
		(children anySatisfy: [ :c | c class = FASTJavaVoidTypeExpression ]).
		
	inExpressionEntities := (children select: [ :c | c class = FASTJavaStatementBlock ]) first children.
	self assert: inExpressionEntities size equals: 2.

	self assert:
		(inExpressionEntities anySatisfy: [ :c | c class = FASTJavaVarDeclStatement ]).

	self assert:
		(inExpressionEntities anySatisfy: [ :c | c class = FASTJavaExpressionStatement ]).

]
