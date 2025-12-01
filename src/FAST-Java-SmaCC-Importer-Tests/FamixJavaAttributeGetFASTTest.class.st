Class {
	#name : 'FamixJavaAttributeGetFASTTest',
	#superclass : 'TestCase',
	#instVars : [
		'fast'
	],
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
FamixJavaAttributeGetFASTTest >> setUp [

	| attribute |
	attribute := FamixJavaAttribute new.
	attribute sourceAnchor: (FamixJavaSourceTextAnchor new source: 'THIS_ATTRIBUTE = "a value"').

	fast := attribute getFAST.

]

{ #category : 'tests' }
FamixJavaAttributeGetFASTTest >> testASTLHSIsAVariable [

	self assert: fast variable class equals: FASTJavaVariableExpression 
]

{ #category : 'tests' }
FamixJavaAttributeGetFASTTest >> testASTLHSNameIsAVariable [

	self assert: fast variable name equals: 'THIS_ATTRIBUTE' 
]

{ #category : 'tests' }
FamixJavaAttributeGetFASTTest >> testASTRHSIsString [

	self assert: fast expression class equals: FASTJavaStringLiteral 
]

{ #category : 'tests' }
FamixJavaAttributeGetFASTTest >> testASTRHSValueIsA_value [

	self assert: fast expression primitiveValue equals: 'a value' 
]

{ #category : 'tests' }
FamixJavaAttributeGetFASTTest >> testFASTRootIsExpression [

	self assert: fast class equals: FASTJavaAssignmentExpression
]
