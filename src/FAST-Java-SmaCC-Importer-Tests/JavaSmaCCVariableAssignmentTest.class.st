Class {
	#name : 'JavaSmaCCVariableAssignmentTest',
	#superclass : 'TestCase',
	#instVars : [
		'fast'
	],
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

	fast := JavaSmaCCProgramNodeImporterVisitor new getExpressionAST: self expressionString 
]

{ #category : 'tests' }
JavaSmaCCVariableAssignmentTest >> testASTIsAnExpression [

	self assert: fast class equals: FASTJavaAssignmentExpression 
]

{ #category : 'tests' }
JavaSmaCCVariableAssignmentTest >> testASTLHSIsAVariable [

	self assert: fast variable class equals: FASTJavaVariableExpression 
]

{ #category : 'tests' }
JavaSmaCCVariableAssignmentTest >> testASTLHSNameIsAVariable [

	self assert: fast variable name equals: 'aVariable' 
]

{ #category : 'tests' }
JavaSmaCCVariableAssignmentTest >> testASTRHSIsString [

	self assert: fast expression class equals: FASTJavaStringLiteral 
]

{ #category : 'tests' }
JavaSmaCCVariableAssignmentTest >> testASTRHSValueIsA_value [

	self assert: fast expression primitiveValue equals: 'a value' 
]
