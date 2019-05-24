Class {
	#name : #JavaSmaCCLambdaTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodLambda'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaTest >> methodLambda [
	^ 'method() {
		a.method(() -> anImvocation().anotherOne());
	}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaTest >> setUp [
	super setUp.
	methodLambda := (self parseMethod: 'lambda')
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaTest >> testLambdaExpressionParentNode [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first expression parentNode equals: (methodLambda allWithType: FASTJavaLambdaExpression) first.
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaTest >> testLambdaExpressionType [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first expression class equals: FASTJavaMethodInvocation.
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaTest >> testLambdaInModelSize [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) size equals: 1
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaTest >> testLambdaParentNode [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first parentNode class equals: FASTJavaMethodInvocation.
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaTest >> testLambdaParentNodeArguments [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first parentNode arguments first equals: (methodLambda allWithType: FASTJavaLambdaExpression) first.
]
