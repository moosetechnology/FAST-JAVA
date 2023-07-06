Class {
	#name : #JavaSmaCCLambdaStatementBlockExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCLambdaStatementBlockExpressionTest >> javaMethod [
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

{ #category : #tests }
JavaSmaCCLambdaStatementBlockExpressionTest >> testLambdaExpressionParentNode [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first expression parentNode equals: (fastModel allWithType: FASTJavaLambdaExpression) first.
]

{ #category : #tests }
JavaSmaCCLambdaStatementBlockExpressionTest >> testLambdaExpressionType [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first expression class equals: FASTJavaStatementBlock .
]

{ #category : #tests }
JavaSmaCCLambdaStatementBlockExpressionTest >> testLambdaInModelSize [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) size equals: 1
]

{ #category : #tests }
JavaSmaCCLambdaStatementBlockExpressionTest >> testLambdaParentNode [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first parentNode class equals: FASTJavaMethodInvocation.
]

{ #category : #tests }
JavaSmaCCLambdaStatementBlockExpressionTest >> testLambdaParentNodeArguments [
	self assert: (fastModel allWithType: FASTJavaLambdaExpression) first parentNode arguments first equals: (fastModel allWithType: FASTJavaLambdaExpression) first.
]
