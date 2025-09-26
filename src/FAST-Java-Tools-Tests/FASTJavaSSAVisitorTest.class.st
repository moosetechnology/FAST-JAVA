"
A FASTJavaSSAVisitorTest is a test class for testing the behavior of FASTJavaSSAVisitor
"
Class {
	#name : 'FASTJavaSSAVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitor',
		'builder',
		'ssa'
	],
	#category : 'FAST-Java-Tools-Tests',
	#package : 'FAST-Java-Tools-Tests'
}

{ #category : 'running' }
FASTJavaSSAVisitorTest >> runVisitor: anAst [

	^ssa := visitor on: anAst 
]

{ #category : 'running' }
FASTJavaSSAVisitorTest >> setUp [
	super setUp.

	visitor := FASTJavaSSAVisitor new.
	builder := FASTJavaTestNodeBuilder new
]

{ #category : 'tests' }
FASTJavaSSAVisitorTest >> testOrder [
	"
   { 
		int x;
		x = 1;		
   }
	"

	|  ast var assignment |
	
	var := builder var: 'x' declaration: 'int'.
	assignment := builder exprStatement: (builder assignment: 'x' value: (builder literalInt: 1)).
	ast := builder block: { var. assignment }.
	
	self runVisitor: ast
	
	




]

{ #category : 'tests' }
FASTJavaSSAVisitorTest >> testSingleAssignement [
	"
   { 
		int x;
		x = 1;		
   }
	"

	| varAccess ast |
	
	
	ast := builder block: {builder var: 'x' declaration: 'int'. builder exprStatement: (builder assignment: 'x' value: (builder literalInt: 1)) }.

   self runVisitor: ast.

	varAccess := ssa statements second expression variable.

	self assert: varAccess ssaVersion class equals: FASTSsaVariableVersion.
	self assert: varAccess ssaVersion version equals: 1.
	self assert: varAccess ssaName equals: 'x_1'.

	self assert: varAccess localDeclaration newVersionNumber equals: 2

]
