Class {
	#name : 'JavaSmaCCLambdaWithArgumentsTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'as yet unclassified' }
JavaSmaCCLambdaWithArgumentsTest >> javaMethod [
	^ 'method() {
		a.method((Person p, int i) -> anImvocation().anotherOne());
	}'
]

{ #category : 'tests' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaExpressionParentNode [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first expression parentNode equals: (fastModel allWithType: FASTJavaLambdaExpression) first.
]

{ #category : 'tests' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaExpressionType [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first expression class equals: FASTJavaMethodInvocation.
]

{ #category : 'tests' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaInModelSize [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaParametersParentNode [
	(fastModel allWithType: FASTJavaLambdaExpression) first parameters do: [ :parameter | 
		self assert: (fastModel allWithType: FASTJavaLambdaExpression) first equals: parameter parentNode. ]
]

{ #category : 'tests' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaParametersSize [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first parameters size equals: 2.
]

{ #category : 'tests' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaParentNode [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first parentNode class equals: FASTJavaMethodInvocation.
]

{ #category : 'tests' }
JavaSmaCCLambdaWithArgumentsTest >> testLambdaParentNodeArguments [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first parentNode arguments first equals: (fastModel allWithType: FASTJavaLambdaExpression) first.
]
