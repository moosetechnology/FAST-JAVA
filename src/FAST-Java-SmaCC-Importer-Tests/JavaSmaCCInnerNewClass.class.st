Class {
	#name : #JavaSmaCCInnerNewClass,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'model'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCInnerNewClass >> methodInnerNewClass [
	
	^ 'void method() {
		MyClass clzz = new SomeOtherClass(false, AnotherClass.this).new MyClass(args);
	}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCInnerNewClass >> setUp [
	super setUp.
	model := (self parseMethod: 'innerNewClass')
]

{ #category : #'as yet unclassified' }
JavaSmaCCInnerNewClass >> testNewClassExpressionReceiver [

	self
		assert:
			((model allWithSubTypesOf: FASTJavaNewExpression) detect: [ 
				 :newExpression | newExpression type typeName name = 'MyClass' ])
				receiver
		equals:
			((model allWithSubTypesOf: FASTJavaNewExpression) detect: [ 
				 :newExpression | 
				 newExpression type typeName name = 'SomeOtherClass' ]).

	self
		assert:
			((model allWithSubTypesOf: FASTJavaNewExpression) detect: [ 
				 :newExpression | newExpression type typeName name = 'MyClass' ])
		equals:
			((model allWithSubTypesOf: FASTJavaNewExpression) detect: [ 
				 :newExpression | 
				 newExpression type typeName name = 'SomeOtherClass' ])
				receiverOwner
]

{ #category : #'as yet unclassified' }
JavaSmaCCInnerNewClass >> testNumberNewClassExpression [

	self
		assert: (model allWithSubTypesOf: FASTJavaNewExpression) size
		equals: 2
]
