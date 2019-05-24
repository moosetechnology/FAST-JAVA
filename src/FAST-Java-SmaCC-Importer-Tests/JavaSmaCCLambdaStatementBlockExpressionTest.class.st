Class {
	#name : #JavaSmaCCLambdaStatementBlockExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodLambda'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaStatementBlockExpressionTest >> methodLambda [
	^ 'method() {
		a.method( (file) -> {
                String onlyName = file.getName();
                String target = FileUtil.stripPath(endpoint.getFileName());
                log.trace("File changed: {}", onlyName);
                if (onlyName.equals(target)) {
                    // file is changed
                    watchFileChanged = true;
                }
            });
}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaStatementBlockExpressionTest >> setUp [
	super setUp.
	methodLambda := (self parseMethod: 'lambda')
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaStatementBlockExpressionTest >> testLambdaExpressionParentNode [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first expression parentNode equals: (methodLambda allWithType: FASTJavaLambdaExpression) first.
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaStatementBlockExpressionTest >> testLambdaExpressionType [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first expression class equals: FASTStatementBlock .
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaStatementBlockExpressionTest >> testLambdaInModelSize [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) size equals: 1
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaStatementBlockExpressionTest >> testLambdaParentNode [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first parentNode class equals: FASTJavaMethodInvocation.
]

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaStatementBlockExpressionTest >> testLambdaParentNodeArguments [
	self assert: (methodLambda allWithType: FASTJavaLambdaExpression) first parentNode arguments first equals: (methodLambda allWithType: FASTJavaLambdaExpression) first.
]
