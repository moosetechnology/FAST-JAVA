Class {
	#name : 'JavaSmaCCLambdaTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCLambdaTest >> javaMethod [
	^ 'method() {
		a.method(() -> anImvocation().anotherOne());
	}'
]

{ #category : 'tests' }
JavaSmaCCLambdaTest >> testLambdaExpressionParentNode [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first expression parentNode equals: (fastModel allWithType: FASTJavaLambdaExpression) first.
]

{ #category : 'tests' }
JavaSmaCCLambdaTest >> testLambdaExpressionType [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first expression class equals: FASTJavaMethodInvocation.
]

{ #category : 'tests' }
JavaSmaCCLambdaTest >> testLambdaInModelSize [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCLambdaTest >> testLambdaParentNode [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first parentNode class equals: FASTJavaMethodInvocation.
]

{ #category : 'tests' }
JavaSmaCCLambdaTest >> testLambdaParentNodeArguments [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first parentNode arguments first equals: (fastModel allWithType: FASTJavaLambdaExpression) first.
]
