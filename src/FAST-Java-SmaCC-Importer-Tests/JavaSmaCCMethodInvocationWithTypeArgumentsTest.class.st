Class {
	#name : 'JavaSmaCCMethodInvocationWithTypeArgumentsTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCMethodInvocationWithTypeArgumentsTest >> invocation [

	^ (fastModel allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : 'accessing' }
JavaSmaCCMethodInvocationWithTypeArgumentsTest >> javaMethod [

	^ 'public void hello() {
	Source.<String, Integer>make(1, 2);
}'
]

{ #category : 'tests' }
JavaSmaCCMethodInvocationWithTypeArgumentsTest >> testInvocationArgumentsAreNotTypeArguments [

	self assert: self invocation arguments size equals: 2.
	self assert: (self invocation arguments allSatisfy: [ :each | each class = FASTJavaIntegerLiteral ])
]

{ #category : 'tests' }
JavaSmaCCMethodInvocationWithTypeArgumentsTest >> testInvocationArrayTypeArgumentIsKept [

	| withArray |
	withArray := self parseMethodString: 'public void hello() {
	Source.<String[]>make();
}'.

	self
		assert: (withArray allWithType: FASTJavaMethodInvocation) anyOne typeArguments anyOne class
		equals: FASTJavaArrayTypeExpression
]

{ #category : 'tests' }
JavaSmaCCMethodInvocationWithTypeArgumentsTest >> testInvocationTypeArgumentKnowsTheInvocation [

	self assert: self invocation typeArguments anyOne javaMethodInvocationTypeArgumentOwner equals: self invocation
]

{ #category : 'tests' }
JavaSmaCCMethodInvocationWithTypeArgumentsTest >> testInvocationTypeArgumentNames [

	self assert: (self invocation typeArguments collect: [ :each | each typeName name ]) asArray equals: #( 'String' 'Integer' )
]

{ #category : 'tests' }
JavaSmaCCMethodInvocationWithTypeArgumentsTest >> testInvocationTypeArgumentsNumber [

	self assert: self invocation typeArguments size equals: 2
]

{ #category : 'tests' }
JavaSmaCCMethodInvocationWithTypeArgumentsTest >> testInvocationWithoutTypeArgumentsHasNone [

	| plain |
	plain := self parseMethodString: 'public void hello() {
	make(1, 2);
}'.

	self assertEmpty: (plain allWithType: FASTJavaMethodInvocation) anyOne typeArguments
]
