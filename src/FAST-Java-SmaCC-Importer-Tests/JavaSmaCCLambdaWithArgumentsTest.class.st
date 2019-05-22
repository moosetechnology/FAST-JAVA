Class {
	#name : #JavaSmaCCLambdaWithArgumentsTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodLambda'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaWithArgumentsTest >> methodLambda [
	^ 'method() {
		a.method((Person p, int i) -> anImvocation().anotherOne());
	}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaWithArgumentsTest >> setUp [
	super setUp.
	methodLambda := (self parseMethod: 'lambda')
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaExpressionParentNode [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first expression parentNode equals: (methodLambda allWithType: FASTJavaLambdaExpression) first.
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaExpressionType [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first expression class equals: FASTJavaMethodInvocation.
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaInModelSize [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) size equals: 1
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaParametersParentNode [
	(methodLambda allWithType: FASTJavaLambdaExpression) first parameters do: [ :parameter | 
		self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first equals: parameter parentNode. ]
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaParametersSize [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first parameters size equals: 2.
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaParentNode [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first parentNode class equals: FASTJavaMethodInvocation.
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaParentNodeArguments [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first parentNode arguments first equals: (methodLambda allWithType: FASTJavaLambdaExpression) first.
]
