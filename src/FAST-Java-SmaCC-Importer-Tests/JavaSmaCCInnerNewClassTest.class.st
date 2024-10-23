Class {
	#name : 'JavaSmaCCInnerNewClassTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCInnerNewClassTest >> javaMethod [
	
	^ 'void method() {
		MyClass clzz = new SomeOtherClass(false, AnotherClass.this).new MyClass(args);
	}'
]

{ #category : 'accessing' }
JavaSmaCCInnerNewClassTest >> testNewClassExpressionReceiver [

	self
		assert:
			((fastModel allWithSubTypesOf: FASTJavaNewExpression) detect: [ 
				 :newExpression | newExpression type typeName name = 'MyClass' ])
				receiver
		equals:
			((fastModel allWithSubTypesOf: FASTJavaNewExpression) detect: [ 
				 :newExpression | 
				 newExpression type typeName name = 'SomeOtherClass' ]).

	self
		assert:
			((fastModel allWithSubTypesOf: FASTJavaNewExpression) detect: [ 
				 :newExpression | newExpression type typeName name = 'MyClass' ])
		equals:
			((fastModel allWithSubTypesOf: FASTJavaNewExpression) detect: [ 
				 :newExpression | 
				 newExpression type typeName name = 'SomeOtherClass' ])
				receiverOwner
]

{ #category : 'accessing' }
JavaSmaCCInnerNewClassTest >> testNumberNewClassExpression [

	self
		assert: (fastModel allWithSubTypesOf: FASTJavaNewExpression) size
		equals: 2
]
