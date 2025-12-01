Class {
	#name : 'JavaSmaCCVariableAssignmentTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCVariableAssignmentTest >> expressionString [
	
	^ 'aVariable = "a value"'
]

{ #category : 'running' }
JavaSmaCCVariableAssignmentTest >> javaMethod [
	self shouldNotImplement
]

{ #category : 'running' }
JavaSmaCCVariableAssignmentTest >> setUp [
	"Note that fastModel is not a MooseModel, but the root node of an AST"

	fastModel := JavaSmaCCProgramNodeImporterVisitor new getExpressionAST: self expressionString 
]

{ #category : 'tests' }
JavaSmaCCVariableAssignmentTest >> testASTIsAnExpression [
	"Note that fastModel resulting from a parse is not a MooseModel, but the root node of an AST"

	self assert: fastModel class equals: FASTJavaAssignmentExpression 
]

{ #category : 'tests' }
JavaSmaCCVariableAssignmentTest >> testASTLHSIsAVariable [
	"Note that fastModel resulting from a parse is not a MooseModel, but the root node of an AST"

	self assert: fastModel variable class equals: FASTJavaVariableExpression 
]

{ #category : 'tests' }
JavaSmaCCVariableAssignmentTest >> testASTLHSNameIsAVariable [
	"Note that fastModel resulting from a parse is not a MooseModel, but the root node of an AST"

	self assert: fastModel variable name equals: 'aVariable' 
]

{ #category : 'tests' }
JavaSmaCCVariableAssignmentTest >> testASTRHSIsString [
	"Note that fastModel resulting from a parse is not a MooseModel, but the root node of an AST"

	self assert: fastModel expression class equals: FASTJavaStringLiteral 
]

{ #category : 'tests' }
JavaSmaCCVariableAssignmentTest >> testASTRHSValueIsA_value [
	"Note that fastModel resulting from a parse is not a MooseModel, but the root node of an AST"

	self assert: fastModel expression primitiveValue equals: 'a value' 
]
